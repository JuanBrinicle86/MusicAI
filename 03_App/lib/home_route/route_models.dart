import 'package:flutter/foundation.dart';

enum RouteStatus { completed, active, available, locked }

@immutable
class Exercise {
  const Exercise({required this.id, required this.title, required this.status});

  final String id;
  final String title;
  final RouteStatus status;

  bool get isCompleted => status == RouteStatus.completed;
  bool get isActive => status == RouteStatus.active;
  bool get isAvailable => status == RouteStatus.available;
  bool get isLocked => status == RouteStatus.locked;
}

@immutable
class Lesson {
  const Lesson({
    required this.id,
    required this.title,
    required this.status,
    required this.exercises,
  });

  final String id;
  final String title;
  final RouteStatus status;
  final List<Exercise> exercises;

  bool get isCompleted => status == RouteStatus.completed;
  bool get isActive => status == RouteStatus.active;
  bool get isLocked => status == RouteStatus.locked;

  int get completedExercises => exercises
      .where((exercise) => exercise.status == RouteStatus.completed)
      .length;

  int get totalExercises => exercises.length;

  int get progressPercent {
    if (totalExercises == 0) {
      return 0;
    }
    return ((completedExercises / totalExercises) * 100).round();
  }

  String get progressLabel => '$completedExercises de $totalExercises';
}

@immutable
class LearningLevel {
  const LearningLevel({
    required this.id,
    required this.title,
    required this.status,
    required this.lessons,
  });

  final String id;
  final String title;
  final RouteStatus status;
  final List<Lesson> lessons;

  bool get isCompleted => status == RouteStatus.completed;
  bool get isActive => status == RouteStatus.active;
  bool get isLocked => status == RouteStatus.locked;

  int get completedExercises {
    return lessons.fold<int>(
      0,
      (total, lesson) => total + lesson.completedExercises,
    );
  }

  int get totalExercises {
    return lessons.fold<int>(
      0,
      (total, lesson) => total + lesson.totalExercises,
    );
  }

  int get progressPercent {
    if (totalExercises == 0) {
      return 0;
    }
    return ((completedExercises / totalExercises) * 100).round();
  }

  String get progressLabel => '$completedExercises de $totalExercises';

  Exercise? get currentExercise {
    for (final lesson in lessons) {
      for (final exercise in lesson.exercises) {
        if (exercise.status == RouteStatus.active) {
          return exercise;
        }
      }
    }
    return null;
  }
}
