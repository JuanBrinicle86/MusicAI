import 'package:flutter_test/flutter_test.dart';
import 'package:musicai/home_route/demo_route_data.dart';
import 'package:musicai/home_route/route_models.dart';

void main() {
  group('Route models', () {
    test('U1: progress calculation works and total can be zero', () {
      final level = LearningLevel(
        id: 'l1',
        title: 'Nivel',
        status: RouteStatus.completed,
        lessons: [
          Lesson(
            id: 's1',
            title: 'Lección 1',
            status: RouteStatus.completed,
            exercises: [
              Exercise(
                id: 'e1',
                title: 'Ejercicio 1',
                status: RouteStatus.completed,
              ),
              Exercise(
                id: 'e2',
                title: 'Ejercicio 2',
                status: RouteStatus.completed,
              ),
            ],
          ),
          Lesson(
            id: 's2',
            title: 'Lección 2',
            status: RouteStatus.active,
            exercises: [
              Exercise(
                id: 'e3',
                title: 'Ejercicio 3',
                status: RouteStatus.active,
              ),
            ],
          ),
        ],
      );

      expect(level.completedExercises, 2);
      expect(level.totalExercises, 3);
      expect(level.progressPercent, 67);
      expect(level.progressLabel, '2 de 3');

      final emptyLevel = LearningLevel(
        id: 'empty',
        title: 'Vacío',
        status: RouteStatus.available,
        lessons: const [],
      );

      expect(emptyLevel.completedExercises, 0);
      expect(emptyLevel.totalExercises, 0);
      expect(emptyLevel.progressPercent, 0);
      expect(emptyLevel.progressLabel, '0 de 0');
    });

    test(
      'U2: demo dataset is consistent and has a single active route state',
      () {
        final levels = demoRouteLevels;
        final currentLevels = levels
            .where((level) => level.status == RouteStatus.active)
            .toList();
        final currentLessons = levels
            .expand((level) => level.lessons)
            .where((lesson) => lesson.status == RouteStatus.active)
            .toList();
        final currentExercises = levels
            .expand((level) => level.lessons)
            .expand((lesson) => lesson.exercises)
            .where((exercise) => exercise.status == RouteStatus.active)
            .toList();

        expect(currentLevels.length, 1);
        expect(currentLessons.length, 1);
        expect(currentExercises.length, 1);

        for (final level in levels) {
          final lessonStatus = level.lessons.any(
            (lesson) => lesson.status == RouteStatus.active,
          );
          if (level.status == RouteStatus.locked) {
            expect(
              level.lessons.every(
                (lesson) => lesson.status == RouteStatus.locked,
              ),
              isTrue,
            );
            expect(
              level.lessons.every(
                (lesson) => lesson.exercises.every(
                  (exercise) => exercise.status == RouteStatus.locked,
                ),
              ),
              isTrue,
            );
          }
          if (level.status == RouteStatus.completed) {
            expect(
              level.lessons.every(
                (lesson) =>
                    lesson.status == RouteStatus.completed ||
                    lesson.status == RouteStatus.available,
              ),
              isTrue,
            );
          }
          if (lessonStatus) {
            expect(
              level.status == RouteStatus.active ||
                  level.status == RouteStatus.completed,
              isTrue,
            );
          }
        }

        final intermedio = levels.firstWhere(
          (level) => level.id == 'intermedio',
        );
        expect(intermedio.completedExercises, 5);
        expect(intermedio.totalExercises, 12);
        expect(intermedio.progressPercent, 42);

        final acordes = intermedio.lessons.firstWhere(
          (lesson) => lesson.id == 'acordes-con-septima',
        );
        expect(acordes.exercises[0].status, RouteStatus.completed);
        expect(acordes.exercises[1].status, RouteStatus.active);
        expect(acordes.exercises[2].status, RouteStatus.locked);
        expect(acordes.exercises[3].status, RouteStatus.locked);

        expect(
          intermedio.lessons[0].exercises.every(
            (exercise) => exercise.status == RouteStatus.completed,
          ),
          isTrue,
        );
        expect(
          intermedio.lessons[2].exercises.every(
            (exercise) => exercise.status == RouteStatus.locked,
          ),
          isTrue,
        );
      },
    );
  });
}
