import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: RoadmapCoachApp()));
}

class RoadmapCoachApp extends StatelessWidget {
  const RoadmapCoachApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Roadmap Coach',
      home: const Scaffold(
        body: Center(
          child: Text(
            'Roadmap Coach 🚀',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
