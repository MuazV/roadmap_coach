import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app/router.dart';
import 'app/theme.dart';

void main() {
  runApp(const ProviderScope(child: RoadmapCoachApp()));
}

class RoadmapCoachApp extends StatelessWidget {
  const RoadmapCoachApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Roadmap Coach',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      routerConfig: buildRouter(),
    );
  }
}