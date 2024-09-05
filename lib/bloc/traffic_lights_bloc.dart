import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traffic_lights_with_bloc/bloc/traffic_lights_event.dart';
import 'package:traffic_lights_with_bloc/bloc/traffic_lights_state.dart';

class TrafficLightsBloc extends Bloc<TrafficLightsEvent, TrafficLightsState> {
  Timer? _timer;
  bool _isRunning = false;

  TrafficLightsBloc()
      : super(
          const TrafficLightsState(
            colors: [Colors.black, Colors.black, Colors.black],
            countdownValues: [11, 6, 11],
            activeCircle: 0,
            isPaused: false,
          ),
        ) {
    on<StartTrafficLights>(_startTrafficLights);
    on<PauseTrafficLights>(_pauseTrafficLights);
    on<ResumeTrafficLights>(_resumeTrafficLights);
    on<RestartTrafficLights>(_restartTrafficLights);
  }

  Future<void> _startTrafficLights(
    StartTrafficLights event,
    Emitter<TrafficLightsState> emit,
  ) async {
    if (state.isPaused || _isRunning) {
      return;
    }
    _isRunning = true;

    if (state.colors[state.activeCircle] == Colors.black) {
      emit(state.copyWith(colors: [
        Colors.red,
        Colors.black,
        Colors.black,
      ]));
    }

    while (true) {
      if (state.isPaused || !_isRunning) {
        _timer?.cancel();
        _isRunning = false;
        return;
      }
      await _countdown(emit);
      if (state.isPaused || !_isRunning) {
        _timer?.cancel();
        _isRunning = false;
        break;
      }
      await _switchLights(emit);
    }
  }

  Future<void> _countdown(Emitter<TrafficLightsState> emit) async {
    int countdown = state.countdownValues[state.activeCircle];
    for (int a = countdown - 1; a >= 0; a--) {
      if (state.isPaused || !_isRunning) {
        _timer?.cancel();
        return;
      }
      List<int> updatedCountdownValues = List.from(state.countdownValues);
      updatedCountdownValues[state.activeCircle] = a;

      emit(state.copyWith(countdownValues: updatedCountdownValues));

      await Future.delayed(const Duration(seconds: 1));
    }
  }

  Future<void> _switchLights(Emitter<TrafficLightsState> emit) async {
    int nextCircle = (state.activeCircle + 1) % 3;
    List<Color> updatedColors = [Colors.black, Colors.black, Colors.black];
    List<int> updatedCountdownValues = [11, 6, 11];
    if (nextCircle == 0) {
      updatedColors[0] = Colors.red;
    } else if (nextCircle == 1) {
      updatedColors[1] = Colors.yellow;
    } else if (nextCircle == 2) {
      updatedColors[2] = Colors.green;
    }
    emit(state.copyWith(
      activeCircle: nextCircle,
      countdownValues: updatedCountdownValues,
      colors: updatedColors,
    ));
  }

  Future<void> _pauseTrafficLights(
      PauseTrafficLights event, Emitter<TrafficLightsState> emit) async {
    emit(state.copyWith(
      isPaused: true,
    ));
  }

  Future<void> _resumeTrafficLights(
      ResumeTrafficLights event, Emitter<TrafficLightsState> emit) async {
    emit(state.copyWith(isPaused: false));
    add(StartTrafficLights());
  }

  Future<void> _restartTrafficLights(
      RestartTrafficLights event, Emitter<TrafficLightsState> emit) async {
    emit(state.copyWith(
      activeCircle: 0,
      isPaused: false,
      colors: [Colors.black, Colors.black, Colors.black],
      countdownValues: [11, 6, 11],
    ));
    _timer?.cancel();
    _isRunning = false;
  }
}
