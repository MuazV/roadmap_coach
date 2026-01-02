import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'providers/roadmap_provider.dart';

class RoadmapLoadingPage extends ConsumerStatefulWidget {
  final String goal;
  
  const RoadmapLoadingPage({
    super.key,
    required this.goal,
  });

  @override
  ConsumerState<RoadmapLoadingPage> createState() => _RoadmapLoadingPageState();
}

class _RoadmapLoadingPageState extends ConsumerState<RoadmapLoadingPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(roadmapProvider.notifier).generateRoadmap(widget.goal);
    });
  }

  @override
  Widget build(BuildContext context) {
    final roadmapState = ref.watch(roadmapProvider);
    
    return roadmapState.when(
      data: (roadmap) {
        if (roadmap != null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.go('/roadmap');
          });
        }
        
        return _buildLoadingView();
      },
      loading: () => _buildLoadingView(),
      error: (error, stack) => _buildErrorView(error),
    );
  }
  
  Widget _buildLoadingView() {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.route,
                  size: 60,
                  color: Theme.of(context).colorScheme.primary,
                ),
              )
                  .animate(onPlay: (controller) => controller.repeat())
                  .scale(duration: 1500.ms, begin: const Offset(1, 1), end: const Offset(1.2, 1.2))
                  .then()
                  .scale(duration: 1500.ms, begin: const Offset(1.2, 1.2), end: const Offset(1, 1)),
              
              const SizedBox(height: 48),
              
              Text(
                'Yapay Zeka Çalışıyor...',
                style: Theme.of(context).textTheme.headlineMedium,
              ).animate(onPlay: (controller) => controller.repeat()).fadeIn(duration: 1000.ms).then().fadeOut(duration: 1000.ms),
              
              const SizedBox(height: 16),
              
              Text(
                'Senin için özel roadmap hazırlanıyor',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 32),
              
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.flag,
                      size: 32,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      widget.goal,
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ).animate().fadeIn(delay: 500.ms).scale(),
              
              const SizedBox(height: 48),
              
              const _LoadingTip(
                icon: Icons.psychology,
                text: 'Kariyerin için en iyi kaynaklar analiz ediliyor...',
              ).animate(delay: 1000.ms).fadeIn().slideX(begin: -0.3, end: 0),
              
              const SizedBox(height: 16),
              
              const _LoadingTip(
                icon: Icons.timeline,
                text: 'Haftalık öğrenme planı oluşturuluyor...',
              ).animate(delay: 1500.ms).fadeIn().slideX(begin: -0.3, end: 0),
              
              const SizedBox(height: 16),
              
              const _LoadingTip(
                icon: Icons.emoji_events,
                text: 'Milestone\'lar belirleniyor...',
              ).animate(delay: 2000.ms).fadeIn().slideX(begin: -0.3, end: 0),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildErrorView(Object error) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hata'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 80,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 24),
            Text(
              'Bir sorun oluştu',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Text(
              error.toString(),
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            FilledButton(
              onPressed: () => context.go('/goal-input'),
              child: const Text('Tekrar Dene'),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoadingTip extends StatelessWidget {
  final IconData icon;
  final String text;
  
  const _LoadingTip({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.grey[600],
          size: 24,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.grey[600],
            ),
          ),
        ),
      ],
    );
  }
}