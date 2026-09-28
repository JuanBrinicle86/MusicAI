import 'package:flutter/material.dart';

class AssistantSimulationSheet extends StatelessWidget {
  const AssistantSimulationSheet({
    super.key,
    required this.contextType,
    required this.name,
  });

  final String contextType;
  final String name;

  String get generatedPrompt {
    switch (contextType) {
      case 'nivel':
        return 'Explícame el propósito del nivel "$name" dentro de mi ruta de aprendizaje de MusicAI.';
      case 'lección':
        return 'Explícame los conceptos principales de la lección "$name" antes de continuar.';
      default:
        return 'Explícame el propósito, los conceptos o la técnica del ejercicio "$name" antes de realizarlo.';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: Material(
        color: theme.colorScheme.surface,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                child: Container(
                  width: 42,
                  height: 4,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.outline,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Icon(
                    Icons.smart_toy_outlined,
                    color: theme.colorScheme.secondary,
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text(
                      'IA MusicAI',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                'Simulación',
                style: TextStyle(
                  color: theme.colorScheme.secondary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Text('Tipo: $contextType'),
              const SizedBox(height: 8),
              Text('Elemento: $name'),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: theme.colorScheme.outline),
                ),
                child: Text(generatedPrompt),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
