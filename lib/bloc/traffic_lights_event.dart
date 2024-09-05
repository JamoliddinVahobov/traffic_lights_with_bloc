import 'package:equatable/equatable.dart';

abstract class TrafficLightsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class StartTrafficLights extends TrafficLightsEvent {}

class PauseTrafficLights extends TrafficLightsEvent {}

class ResumeTrafficLights extends TrafficLightsEvent {}

class RestartTrafficLights extends TrafficLightsEvent {}
