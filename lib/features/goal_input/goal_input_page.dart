import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

class GoalInputPage extends StatefulWidget {
  const GoalInputPage({super.key});

  @override
  State<GoalInputPage> createState() => _GoalInputPageState();
}

class _GoalInputPageState extends State<GoalInputPage> {
  final _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  
  final List<String> _quickOptions = [
    'Frontend Developer',
    'Backend Developer',
    'Data Scientist',
    'Almanya\'da Buchhalter',
    'Almanca B1 → DTZ',
    'Mobile Developer',
    'DevOps Engineer',
    'UI/UX Designer',
  ];
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  void _selectQuickOption(String option) {
    setState(() {
      _controller.text = option;
    });
  }
  
  void _generateRoadmap() {
    if (_formKey.currentState?.validate() ?? false) {
      context.go('/generating', extra: _controller.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hedefini Belirle'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                '🎯 Ne olmak istiyorsun?',
                style: Theme.of(context).textTheme.headlineMedium,
              ).animate().fadeIn().slideY(begin: 0.2, end: 0),
              
              const SizedBox(height: 12),
              
              Text(
                'Hayalindeki kariyeri veya öğrenmek istediğin konuyu yaz. '
                'Yapay zeka senin için kişiselleştirilmiş bir öğrenme yol haritası oluşturacak.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.grey[600],
                ),
              ).animate().fadeIn(delay: 200.ms),
              
              const SizedBox(height: 32),
              
              TextFormField(
                controller: _controller,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'Örn: Frontend Developer olmak istiyorum\n'
                      'veya: Almanya\'da muhasebeci olmak istiyorum',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Lütfen bir hedef gir';
                  }
                  if (value.trim().length < 10) {
                    return 'Lütfen daha detaylı bir hedef belirt';
                  }
                  return null;
                },
              ).animate().fadeIn(delay: 400.ms).scale(begin: const Offset(0.95, 0.95), end: const Offset(1, 1)),
              
              const SizedBox(height: 32),
              
              Text(
                'veya popüler hedeflerden seç:',
                style: Theme.of(context).textTheme.titleMedium,
              ).animate().fadeIn(delay: 600.ms),
              
              const SizedBox(height: 16),
              
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _quickOptions.asMap().entries.map((entry) {
                  final index = entry.key;
                  final option = entry.value;
                  return ChoiceChip(
                    label: Text(option),
                    selected: _controller.text == option,
                    onSelected: (_) => _selectQuickOption(option),
                  ).animate(delay: (800 + index * 100).ms).fadeIn().scale();
                }).toList(),
              ),
              
              const SizedBox(height: 48),
              
              FilledButton(
                onPressed: _generateRoadmap,
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.auto_awesome),
                    SizedBox(width: 8),
                    Text(
                      'Roadmap Oluştur',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ).animate(delay: 1000.ms).fadeIn().slideY(begin: 0.3, end: 0),
              
              const SizedBox(height: 16),
              
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.blue[200]!),
                ),
                child: Row(
                  children: [
                    Icon(Icons.info_outline, color: Colors.blue[700]),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Roadmap oluşturulması 10-15 saniye sürebilir.',
                        style: TextStyle(color: Colors.blue[900]),
                      ),
                    ),
                  ],
                ),
              ).animate(delay: 1200.ms).fadeIn(),
            ],
          ),
        ),
      ),
    );
  }
}