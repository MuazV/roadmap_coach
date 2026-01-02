import 'package:flutter/material.dart';

class GoalsPage extends StatelessWidget {
  const GoalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final goals = const [
      'Frontend Developer (0 → Junior)',
      'Almanya’da Buchhalter yolu',
      'Almanca B1 → DTZ',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Hedef seç')),
      body: ListView.builder(
        itemCount: goals.length,
        itemBuilder: (_, i) {
          return ListTile(
            title: Text(goals[i]),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // sonraki adım: weekly hours sayfasına gideceğiz
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Seçildi: ${goals[i]}')),
              );
            },
          );
        },
      ),
    );
  }
}
