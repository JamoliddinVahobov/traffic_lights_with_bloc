import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traffic_lights_with_bloc/bloc/traffic_lights_bloc.dart';
import 'package:traffic_lights_with_bloc/traffic_lights_page.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: BlocProvider(
        create: (context) => TrafficLightsBloc(),
        child: const TrafficLightsPage(),
      ),
    );
  }
}
