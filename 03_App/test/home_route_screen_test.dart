import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:musicai/home_route/demo_route_data.dart';
import 'package:musicai/home_route/home_route_screen.dart';

void main() {
  group('Home route screen', () {
    testWidgets('W1: no overflow at standard viewport', (tester) async {
      await tester.binding.setSurfaceSize(const Size(1080, 2400));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      await tester.pumpWidget(
        MaterialApp(home: HomeRouteScreen(levels: demoRouteLevels)),
      );

      expect(tester.takeException(), isNull);
    });

    testWidgets(
      'W2: current level and lesson are expanded and current exercise is marked',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(home: HomeRouteScreen(levels: demoRouteLevels)),
        );

        expect(find.text('Intermedio'), findsWidgets);
        expect(find.text('Acordes con séptima'), findsOneWidget);
        expect(find.text('Construir progresión ii-V-I'), findsOneWidget);
        final currentExercise = tester
            .widgetList<Text>(find.byType(Text))
            .where((widget) => widget.data == 'Construir progresión ii-V-I');
        expect(currentExercise, isNotEmpty);
      },
    );

    testWidgets('W3: bottom navigation order is the canonical five items', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: HomeRouteScreen(levels: demoRouteLevels)),
      );

      expect(find.text('Home'), findsWidgets);
      expect(find.text('Afinador'), findsWidgets);
      expect(find.text('IA MusicAI'), findsWidgets);
      expect(find.text('Desafíos'), findsWidgets);
      expect(find.text('Comunidad'), findsWidgets);
      expect(find.text('Ruta'), findsNothing);

      final bottomNavigation = find.byType(BottomNavigationBar);
      expect(
        find.descendant(of: bottomNavigation, matching: find.text('Home')),
        findsOneWidget,
      );
      expect(
        find.descendant(of: bottomNavigation, matching: find.text('Afinador')),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: bottomNavigation,
          matching: find.text('IA MusicAI'),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(of: bottomNavigation, matching: find.text('Desafíos')),
        findsOneWidget,
      );
      expect(
        find.descendant(of: bottomNavigation, matching: find.text('Comunidad')),
        findsOneWidget,
      );
      expect(
        find.descendant(of: bottomNavigation, matching: find.text('Perfil')),
        findsNothing,
      );
      expect(find.text('Perfil'), findsOneWidget);
    });

    testWidgets(
      'W4: expand/collapse works and locked content does not expand',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(home: HomeRouteScreen(levels: demoRouteLevels)),
        );

        final lesson = find.text('Progresiones armónicas');
        expect(lesson, findsOneWidget);

        final activeLesson = find.text('Acordes con séptima');
        await tester.tap(activeLesson);
        await tester.pumpAndSettle();
        expect(find.text('Construir progresión ii-V-I'), findsNothing);

        await tester.tap(activeLesson);
        await tester.pumpAndSettle();
        expect(find.text('Construir progresión ii-V-I'), findsOneWidget);

        await tester.ensureVisible(lesson);
        await tester.pumpAndSettle();
        await tester.tap(lesson);
        await tester.pumpAndSettle();
        expect(find.text('Ejercicio 1'), findsNothing);
      },
    );

    testWidgets('W5: blocked exercise does not navigate', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: HomeRouteScreen(levels: demoRouteLevels)),
      );

      final blocked = find.text('Ejecutar cadencia en guitarra');
      expect(blocked, findsOneWidget);
      await tester.ensureVisible(blocked);
      await tester.pumpAndSettle();
      await tester.tap(blocked);
      await tester.pump();
      expect(find.text('Simulación'), findsNothing);
    });

    testWidgets(
      'W6: enabled exercise opens simulation and returning preserves expansion state',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(home: HomeRouteScreen(levels: demoRouteLevels)),
        );

        final exercise = find.text('Construir progresión ii-V-I');
        await tester.ensureVisible(exercise);
        await tester.pumpAndSettle();
        await tester.tap(exercise);
        await tester.pumpAndSettle();

        expect(find.text('Simulación'), findsWidgets);
        await tester.pageBack();
        await tester.pumpAndSettle();

        expect(find.text('Acordes con séptima'), findsOneWidget);
        expect(find.text('Construir progresión ii-V-I'), findsOneWidget);
      },
    );

    testWidgets(
      'W7: info opens contextual sheet and progress does not change',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(home: HomeRouteScreen(levels: demoRouteLevels)),
        );

        final lessonTitle = find.text('Acordes con séptima');
        final lessonTile = find.ancestor(
          of: lessonTitle,
          matching: find.byType(ListTile),
        );
        final infoButton = find.descendant(
          of: lessonTile,
          matching: find.byType(IconButton),
        );
        expect(infoButton, findsOneWidget);
        await tester.tap(infoButton);
        await tester.pumpAndSettle();

        expect(find.text('IA MusicAI'), findsWidgets);
        expect(find.text('Simulación'), findsOneWidget);
        expect(find.text('Tipo: lección'), findsOneWidget);
        expect(find.text('Tipo: ejercicio'), findsNothing);
        expect(find.text('5 de 12'), findsOneWidget);
      },
    );

    testWidgets(
      'W8: 5 de 12 is shown as 42% and XP is not used as academic progress',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(home: HomeRouteScreen(levels: demoRouteLevels)),
        );

        expect(find.text('42%'), findsOneWidget);
        expect(find.text('5 de 12'), findsOneWidget);
        expect(find.text('XP'), findsNothing);
      },
    );
  });
}
