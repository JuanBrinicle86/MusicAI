import 'package:flutter/material.dart';
import 'package:musicai/home_route/progress_summary_card.dart';
import 'package:musicai/home_route/route_models.dart';
import 'package:musicai/shell/musicai_bottom_nav.dart';
import 'package:musicai/shell/musicai_header.dart';
import 'package:musicai/simulation/assistant_simulation_sheet.dart';
import 'package:musicai/simulation/simulated_destination_screen.dart';

class HomeRouteScreen extends StatefulWidget {
  const HomeRouteScreen({super.key, required this.levels});

  final List<LearningLevel> levels;

  @override
  State<HomeRouteScreen> createState() => _HomeRouteScreenState();
}

class _HomeRouteScreenState extends State<HomeRouteScreen> {
  final Set<String> _expandedLevels = <String>{};
  final Set<String> _expandedLessons = <String>{};

  LearningLevel get currentLevel {
    return widget.levels.firstWhere(
      (level) => level.status == RouteStatus.active,
    );
  }

  Lesson get activeLesson {
    return currentLevel.lessons.firstWhere(
      (lesson) => lesson.status == RouteStatus.active,
    );
  }

  Exercise get currentExercise {
    return activeLesson.exercises.firstWhere(
      (exercise) => exercise.status == RouteStatus.active,
    );
  }

  @override
  void initState() {
    super.initState();
    _expandedLevels.add(currentLevel.id);
    _expandedLessons.add(activeLesson.id);
  }

  void _openDestination(String label) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => SimulatedDestinationScreen(title: label),
      ),
    );
  }

  void _openInfo(String type, String name) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => AssistantSimulationSheet(contextType: type, name: name),
    );
  }

  void _handleExerciseTap(Exercise exercise) {
    if (exercise.status == RouteStatus.locked) {
      return;
    }

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => SimulatedDestinationScreen(title: exercise.title),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final intermedio = widget.levels.firstWhere(
      (level) => level.id == 'intermedio',
    );
    final completed = intermedio.completedExercises;
    final total = intermedio.totalExercises;
    final percent = intermedio.progressPercent;

    return Scaffold(
      appBar: MusicAiHeader(
        onProfile: () => _openDestination('Perfil'),
        onNotifications: () => _openDestination('Notificaciones'),
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 12),
        children: [
          ProgressSummaryCard(
            percent: percent,
            completedLabel: '$completed de $total',
          ),
          const SizedBox(height: 8),
          ...widget.levels.map((level) {
            final isCurrent = level.status == RouteStatus.active;
            final isLocked = level.status == RouteStatus.locked;
            final levelColor = level.isCompleted
                ? const Color(0xFF4ADE80)
                : isCurrent
                ? Theme.of(context).colorScheme.secondary
                : Theme.of(context).colorScheme.onSurfaceVariant;

            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              clipBehavior: Clip.antiAlias,
              child: ExpansionTile(
                initiallyExpanded: level.id == currentLevel.id,
                enabled: !isLocked,
                tilePadding: const EdgeInsets.symmetric(horizontal: 16),
                childrenPadding: const EdgeInsets.only(bottom: 8),
                shape: const Border(),
                collapsedShape: const Border(),
                collapsedIconColor: levelColor,
                iconColor: levelColor,
                backgroundColor: isCurrent
                    ? Theme.of(context).colorScheme.primaryContainer
                    : null,
                title: Row(
                  children: [
                    Expanded(
                      child: Text(
                        level.title,
                        style: TextStyle(
                          color: isLocked
                              ? Theme.of(context).colorScheme.onSurfaceVariant
                              : null,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    if (isCurrent)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'Actual',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                  ],
                ),
                leading: Icon(
                  level.isCompleted
                      ? Icons.check_circle
                      : isCurrent
                      ? Icons.radio_button_checked
                      : Icons.lock,
                  color: levelColor,
                ),
                onExpansionChanged: (expanded) {
                  if (expanded) {
                    _expandedLevels.add(level.id);
                  } else {
                    _expandedLevels.remove(level.id);
                  }
                },
                children: level.lessons.map((lesson) {
                  final lessonAccessible = lesson.status != RouteStatus.locked;

                  return Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: ExpansionTile(
                      initiallyExpanded: lesson.id == activeLesson.id,
                      enabled: lessonAccessible,
                      tilePadding: const EdgeInsets.only(left: 12, right: 12),
                      childrenPadding: const EdgeInsets.only(left: 8),
                      shape: const Border(),
                      collapsedShape: const Border(),
                      backgroundColor: lesson.status == RouteStatus.active
                          ? Theme.of(context)
                                .colorScheme
                                .surfaceContainerHighest
                          : null,
                      title: Row(
                        children: [
                          Expanded(
                            child: Text(
                              lesson.title,
                              style: TextStyle(
                                color: lesson.status == RouteStatus.locked
                                    ? Theme.of(context)
                                          .colorScheme
                                          .onSurfaceVariant
                                    : null,
                                fontWeight: lesson.status == RouteStatus.active
                                    ? FontWeight.w700
                                    : FontWeight.w500,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: lessonAccessible
                                ? () => _openInfo('lección', lesson.title)
                                : null,
                            icon: const Icon(Icons.info_outline),
                          ),
                        ],
                      ),
                      onExpansionChanged: (expanded) {
                        if (expanded) {
                          _expandedLessons.add(lesson.id);
                        } else {
                          _expandedLessons.remove(lesson.id);
                        }
                      },
                      children: lesson.exercises.map((exercise) {
                        final isCurrent = exercise.id == currentExercise.id;
                        final canNavigate =
                            exercise.status != RouteStatus.locked;
                        return ListTile(
                          enabled: canNavigate,
                          contentPadding: const EdgeInsets.only(
                            left: 20,
                            right: 8,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: isCurrent
                                ? BorderSide(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary,
                                  )
                                : BorderSide.none,
                          ),
                          tileColor: isCurrent
                              ? Theme.of(context).colorScheme.primaryContainer
                              : null,
                          leading: Icon(
                            exercise.status == RouteStatus.completed
                                ? Icons.check_circle
                                : exercise.status == RouteStatus.active
                                ? Icons.play_circle_fill
                                : Icons.lock,
                            color: exercise.status == RouteStatus.locked
                                ? Theme.of(context).colorScheme.onSurfaceVariant
                                : exercise.status == RouteStatus.completed
                                ? const Color(0xFF4ADE80)
                                : Theme.of(context).colorScheme.secondary,
                          ),
                          title: Text(
                            exercise.title,
                            style: isCurrent
                                ? TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface,
                                  )
                                : TextStyle(
                                    color: exercise.status == RouteStatus.locked
                                        ? Theme.of(context)
                                              .colorScheme
                                              .onSurfaceVariant
                                        : null,
                                  ),
                          ),
                          trailing: IconButton(
                            onPressed: canNavigate
                                ? () => _openInfo('ejercicio', exercise.title)
                                : null,
                            icon: const Icon(Icons.info_outline),
                          ),
                          onTap: canNavigate
                              ? () => _handleExerciseTap(exercise)
                              : null,
                        );
                      }).toList(),
                    ),
                  );
                }).toList(),
              ),
            );
          }),
        ],
      ),
      bottomNavigationBar: MusicAiBottomNav(
        currentIndex: 0,
        onTap: (index) {
          switch (index) {
            case 0:
              break;
            case 1:
              _openDestination('Afinador');
              break;
            case 2:
              _openInfo('nivel', currentLevel.title);
              break;
            case 3:
              _openDestination('Desafíos');
              break;
            case 4:
              _openDestination('Comunidad');
              break;
            default:
              break;
          }
        },
      ),
    );
  }
}
