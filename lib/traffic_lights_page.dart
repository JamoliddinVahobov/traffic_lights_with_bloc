import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traffic_lights_with_bloc/bloc/traffic_lights_bloc.dart';
import 'package:traffic_lights_with_bloc/bloc/traffic_lights_event.dart';
import 'package:traffic_lights_with_bloc/bloc/traffic_lights_state.dart';

class TrafficLightsPage extends StatelessWidget {
  const TrafficLightsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Container(
                  height: 450,
                  width: 170,
                  color: Colors.black,
                  child: BlocBuilder<TrafficLightsBloc, TrafficLightsState>(
                    builder: (context, state) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            radius: 70,
                            backgroundColor: state.countdownValues.isNotEmpty
                                ? state.colors[0]
                                : Colors.black,
                            child: state.countdownValues.isNotEmpty &&
                                    state.countdownValues[0] != 11
                                ? Text(
                                    state.countdownValues[0].toString(),
                                    style: const TextStyle(
                                        fontSize: 30, color: Colors.black),
                                  )
                                : null,
                          ),
                          CircleAvatar(
                            radius: 70,
                            backgroundColor: state.countdownValues.isNotEmpty
                                ? state.colors[1]
                                : Colors.black,
                            child: state.countdownValues.isNotEmpty &&
                                    state.countdownValues[1] != 6
                                ? Text(
                                    state.countdownValues[1].toString(),
                                    style: const TextStyle(
                                        fontSize: 30, color: Colors.black),
                                  )
                                : null,
                          ),
                          CircleAvatar(
                            radius: 70,
                            backgroundColor: state.countdownValues.isNotEmpty
                                ? state.colors[2]
                                : Colors.black,
                            child: state.countdownValues.isNotEmpty &&
                                    state.countdownValues[2] != 11
                                ? Text(
                                    state.countdownValues[2].toString(),
                                    style: const TextStyle(
                                        fontSize: 30, color: Colors.black),
                                  )
                                : null,
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Container(
                  height: 200,
                  width: 40,
                  color: Colors.black,
                ),
              ],
            ),
            InkWell(
              splashColor: Colors.grey.withOpacity(0.5),
              borderRadius: BorderRadius.circular(30),
              onTap: () {
                context.read<TrafficLightsBloc>().add(
                      StartTrafficLights(),
                    );
              },
              child: Ink(
                height: 50,
                width: 170,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Center(
                  child: Text(
                    'Start Traffic Lights',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
