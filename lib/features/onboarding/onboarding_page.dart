import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Roadmap Coach')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            const Text(
              'Hedefine giden yol haritanı oluştur.\nHaftalık plan + motivasyon + takip.',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () => context.go('/goals'),
              child: const Text('Başla'),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
