import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class TrafficLightsState extends Equatable {
  final List<Color> colors;
  final List<int> countdownValues;
  final int activeCircle;
  final bool isPaused;

  const TrafficLightsState({
    required this.colors,
    required this.countdownValues,
    required this.activeCircle,
    this.isPaused = false,
  });

  TrafficLightsState copyWith({
    List<Color>? colors,
    List<int>? countdownValues,
    int? activeCircle,
    bool? isPaused,
  }) {
    return TrafficLightsState(
      colors: colors ?? this.colors,
      countdownValues: countdownValues ?? this.countdownValues,
      activeCircle: activeCircle ?? this.activeCircle,
      isPaused: isPaused ?? this.isPaused,
    );
  }

  @override
  List<Object> get props => [colors, countdownValues, activeCircle, isPaused];
}
