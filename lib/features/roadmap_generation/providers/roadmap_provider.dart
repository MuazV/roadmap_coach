import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/models/roadmap.dart';
import '../../../core/services/claude_service.dart';

final claudeServiceProvider = Provider((ref) => ClaudeService());

final roadmapProvider = StateNotifierProvider<RoadmapNotifier, AsyncValue<Roadmap?>>((ref) {
  return RoadmapNotifier(ref.read(claudeServiceProvider));
});

class RoadmapNotifier extends StateNotifier<AsyncValue<Roadmap?>> {
  final ClaudeService _claudeService;
  
  RoadmapNotifier(this._claudeService) : super(const AsyncValue.data(null));
  
  Future<void> generateRoadmap(String goal) async {
    state = const AsyncValue.loading();
    
    try {
      final roadmap = await _claudeService.generateRoadmap(goal);
      state = AsyncValue.data(roadmap);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
  
  void clearRoadmap() {
    state = const AsyncValue.data(null);
  }
}