import 'package:equatable/equatable.dart';

abstract class TrafficLightsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class StartTrafficLights extends TrafficLightsEvent {}
