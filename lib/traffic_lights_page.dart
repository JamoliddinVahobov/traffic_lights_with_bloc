import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traffic_lights_with_bloc/bloc/traffic_lights_bloc.dart';
import 'package:traffic_lights_with_bloc/bloc/traffic_lights_event.dart';
import 'package:traffic_lights_with_bloc/bloc/traffic_lights_state.dart';

class TrafficLightsPage extends StatelessWidget {
  const TrafficLightsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: height * 0.5,
                  width: width * 0.4,
                  color: Colors.black,
                  child: BlocBuilder<TrafficLightsBloc, TrafficLightsState>(
                    builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                              child: CircleAvatar(
                                radius: 60,
                                backgroundColor:
                                    state.countdownValues.isNotEmpty
                                        ? state.colors[0]
                                        : Colors.black,
                                child: state.countdownValues.isNotEmpty &&
                                        state.countdownValues[0] != 11
                                    ? FittedBox(
                                        child: Text(
                                          state.countdownValues[0].toString(),
                                          style: const TextStyle(
                                              fontSize: 40,
                                              color: Colors.black),
                                        ),
                                      )
                                    : null,
                              ),
                            ),
                            Flexible(
                              child: CircleAvatar(
                                radius: 60,
                                backgroundColor:
                                    state.countdownValues.isNotEmpty
                                        ? state.colors[1]
                                        : Colors.black,
                                child: state.countdownValues.isNotEmpty &&
                                        state.countdownValues[1] != 6
                                    ? FittedBox(
                                        child: Text(
                                          state.countdownValues[1].toString(),
                                          style: const TextStyle(
                                              fontSize: 40,
                                              color: Colors.black),
                                        ),
                                      )
                                    : null,
                              ),
                            ),
                            Flexible(
                              child: CircleAvatar(
                                radius: 60,
                                backgroundColor:
                                    state.countdownValues.isNotEmpty
                                        ? state.colors[2]
                                        : Colors.black,
                                child: state.countdownValues.isNotEmpty &&
                                        state.countdownValues[2] != 11
                                    ? FittedBox(
                                        child: Text(
                                          state.countdownValues[2].toString(),
                                          style: const TextStyle(
                                              fontSize: 40,
                                              color: Colors.black),
                                        ),
                                      )
                                    : null,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  height: height * 0.2,
                  width: width * 0.1,
                  color: Colors.black,
                ),
              ],
            ),
            Flexible(
              child: InkWell(
                splashColor: Colors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(30),
                onTap: () {
                  context.read<TrafficLightsBloc>().add(
                        StartTrafficLights(),
                      );
                },
                child: Ink(
                  height: 40,
                  width: 170,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Center(
                    child: FittedBox(
                      child: Text(
                        'Start Traffic Lights',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              child: InkWell(
                splashColor: Colors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(30),
                onTap: () {
                  context.read<TrafficLightsBloc>().add(
                        PauseTrafficLights(),
                      );
                },
                child: Ink(
                  height: 40,
                  width: 170,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Center(
                    child: FittedBox(
                      child: Text(
                        'Pause Traffic Lights',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              child: InkWell(
                splashColor: Colors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(30),
                onTap: () {
                  context.read<TrafficLightsBloc>().add(
                        ResumeTrafficLights(),
                      );
                },
                child: Ink(
                  height: 40,
                  width: 170,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Center(
                    child: FittedBox(
                      child: Text(
                        'Resume Traffic Lights',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              child: InkWell(
                splashColor: Colors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(30),
                onTap: () {
                  context.read<TrafficLightsBloc>().add(
                        ResetTrafficLights(),
                      );
                },
                child: Ink(
                  height: 40,
                  width: 170,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Center(
                    child: FittedBox(
                      child: Text(
                        'Reset Traffic Lights',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
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
