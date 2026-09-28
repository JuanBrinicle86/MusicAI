import 'route_models.dart';

class RouteTree {
  const RouteTree({required this.levels});

  final List<LearningLevel> levels;

  LearningLevel get currentLevel =>
      levels.firstWhere((level) => level.status == RouteStatus.active);

  Lesson get activeLesson => currentLevel.lessons.firstWhere(
    (lesson) => lesson.status == RouteStatus.active,
  );

  Exercise get currentExercise => activeLesson.exercises.firstWhere(
    (exercise) => exercise.status == RouteStatus.active,
  );

  int get completedCount =>
      levels.fold<int>(0, (count, level) => count + level.completedExercises);

  int get totalCount =>
      levels.fold<int>(0, (count, level) => count + level.totalExercises);

  int get progressPercent {
    if (totalCount == 0) {
      return 0;
    }
    return ((completedCount / totalCount) * 100).round();
  }
}
