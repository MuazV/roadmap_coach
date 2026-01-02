import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import '../features/onboarding/onboarding_page.dart';
import '../features/goals/goals_page.dart';

GoRouter buildRouter() {
  return GoRouter(
    initialLocation: '/onboarding',
    routes: [
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        path: '/goals',
        builder: (context, state) => const GoalsPage(),
      ),
    ],
  );
}
