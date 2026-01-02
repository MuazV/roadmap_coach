import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              
              Icon(
                Icons.route,
                size: 80,
                color: Theme.of(context).colorScheme.primary,
              ).animate().scale(delay: 200.ms, duration: 600.ms),
              
              const SizedBox(height: 24),
              
              Text(
                'Roadmap Coach',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineLarge,
              ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.3, end: 0),
              
              const SizedBox(height: 16),
              
              Text(
                'Hayalindeki kariyere adım adım ulaş.\nYapay zeka destekli kişisel yol haritanı oluştur.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.grey[600],
                ),
              ).animate().fadeIn(delay: 600.ms),
              
              const SizedBox(height: 48),
              
              const _FeatureRow(
                icon: Icons.psychology,
                text: 'AI destekli öğrenme planı',
              ).animate().fadeIn(delay: 800.ms).slideX(begin: -0.2, end: 0),
              
              const SizedBox(height: 16),
              
              const _FeatureRow(
                icon: Icons.timeline,
                text: 'Haftalık detaylı roadmap',
              ).animate().fadeIn(delay: 1000.ms).slideX(begin: -0.2, end: 0),
              
              const SizedBox(height: 16),
              
              const _FeatureRow(
                icon: Icons.library_books,
                text: 'Kaynak önerileri ve kurslar',
              ).animate().fadeIn(delay: 1200.ms).slideX(begin: -0.2, end: 0),
              
              const SizedBox(height: 16),
              
              const _FeatureRow(
                icon: Icons.trending_up,
                text: 'İlerleme takibi ve motivasyon',
              ).animate().fadeIn(delay: 1400.ms).slideX(begin: -0.2, end: 0),
              
              const Spacer(),
              
              FilledButton(
                onPressed: () => context.go('/goal-input'),
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Başla',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ).animate().fadeIn(delay: 1600.ms).slideY(begin: 0.3, end: 0),
              
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeatureRow extends StatelessWidget {
  final IconData icon;
  final String text;
  
  const _FeatureRow({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Theme.of(context).colorScheme.primary,
          size: 28,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}