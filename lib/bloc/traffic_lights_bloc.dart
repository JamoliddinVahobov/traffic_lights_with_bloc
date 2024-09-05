import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traffic_lights_with_bloc/bloc/traffic_lights_event.dart';
import 'package:traffic_lights_with_bloc/bloc/traffic_lights_state.dart';

class TrafficLightsBloc extends Bloc<TrafficLightsEvent, TrafficLightsState> {
  TrafficLightsBloc()
      : super(
          const TrafficLightsState(
            colors: [Colors.black, Colors.black, Colors.black],
            countdownValues: [11, 6, 11],
            activeCircle: 0,
          ),
        ) {
    on<StartTrafficLights>(_startTrafficLights);
  }
  Future<void> _startTrafficLights(
    StartTrafficLights event,
    Emitter<TrafficLightsState> emit,
  ) async {
    if (state.colors[state.activeCircle] == Colors.black) {
      emit(state.copyWith(colors: [
        Colors.red,
        Colors.black,
        Colors.black,
      ]));
    }

    while (true) {
      await _countdown(emit);
      await _switchLights(emit);
    }
  }

  Future<void> _countdown(Emitter<TrafficLightsState> emit) async {
    int countdown = state.countdownValues[state.activeCircle];
    for (int a = countdown - 1; a >= 0; a--) {
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
}










































// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';
// import 'dart:async';

// // TrafficLightsEvent
// abstract class TrafficLightsEvent extends Equatable {
//   @override
//   List<Object?> get props => [];
// }

// class StartTrafficLights extends TrafficLightsEvent {}

// // TrafficLightsState
// class TrafficLightsState extends Equatable {
//   final List<Color> colors;
//   final List<int> countdownValues;
//   final int activeCircle;

//   const TrafficLightsState({
//     required this.colors,
//     required this.countdownValues,
//     required this.activeCircle,
//   });

//   TrafficLightsState copyWith({
//     List<Color>? colors,
//     List<int>? countdownValues,
//     int? activeCircle,
//   }) {
//     return TrafficLightsState(
//       colors: colors ?? this.colors,
//       countdownValues: countdownValues ?? this.countdownValues,
//       activeCircle: activeCircle ?? this.activeCircle,
//     );
//   }

//   @override
//   List<Object?> get props => [colors, countdownValues, activeCircle];
// }

// TrafficLightsBloc
// class TrafficLightsBloc extends Bloc<TrafficLightsEvent, TrafficLightsState> {
//   TrafficLightsBloc()
//       : super(const TrafficLightsState(
//           colors: [Colors.white, Colors.white, Colors.white],
//           countdownValues: [11, 6, 11],
//           activeCircle: 0,
//         )) {
//     on<StartTrafficLights>(_startTrafficLights);
//   }

//   Future<void> _startTrafficLights(
//       StartTrafficLights event, Emitter<TrafficLightsState> emit) async {
//     if (state.colors[state.activeCircle] == Colors.white) {
//       emit(state.copyWith(colors: [
//         Colors.red,
//         Colors.white,
//         Colors.white,
//       ]));
//     }

//     while (true) {
//       await _countDown(emit);
//       await _switchLights(emit);
//     }
//   }

//   Future<void> _countDown(Emitter<TrafficLightsState> emit) async {
//     int countdown = state.countdownValues[state.activeCircle];

//     for (int i = countdown - 1; i >= 0; i--) {
//       List<int> updatedCountdownValues = List.from(state.countdownValues);
//       updatedCountdownValues[state.activeCircle] = i;

//       emit(state.copyWith(countdownValues: updatedCountdownValues));

//       await Future.delayed(const Duration(seconds: 1));
//     }
//   }

//   Future<void> _switchLights(Emitter<TrafficLightsState> emit) async {
//     int nextCircle = (state.activeCircle + 1) % 3;

//     List<Color> updatedColors = [Colors.white, Colors.white, Colors.white];
//     List<int> updatedCountdownValues = [11, 6, 11];

//     if (nextCircle == 0) {
//       updatedColors[0] = Colors.red;
//     } else if (nextCircle == 1) {
//       updatedColors[1] = Colors.yellow;
//     } else if (nextCircle == 2) {
//       updatedColors[2] = Colors.green;
//     }

//     emit(state.copyWith(
//       colors: updatedColors,
//       countdownValues: updatedCountdownValues,
//       activeCircle: nextCircle,
//     ));
//   }
// }
