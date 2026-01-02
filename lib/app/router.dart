import 'package:go_router/go_router.dart';
import '../features/home/home_page.dart';
import '../features/goal_input/goal_input_page.dart';
import '../features/roadmap_generation/roadmap_loading_page.dart';
import '../features/roadmap_view/roadmap_page.dart';

GoRouter buildRouter() {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/goal-input',
        builder: (context, state) => const GoalInputPage(),
      ),
      GoRoute(
        path: '/generating',
        builder: (context, state) {
          final goal = state.extra as String?;
          return RoadmapLoadingPage(goal: goal ?? '');
        },
      ),
      GoRoute(
        path: '/roadmap',
        builder: (context, state) => const RoadmapPage(),
      ),
    ],
  );
}