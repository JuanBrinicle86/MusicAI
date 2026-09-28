import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:musicai/app.dart';
import 'package:musicai/login/login_screen.dart';

WidgetBuilder testHomeBuilder(String label) {
  return (_) => Scaffold(body: Text(label));
}

void main() {
  group('Login screen', () {
    testWidgets('L1: login screen appears initially', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: LoginScreen(homeBuilder: testHomeBuilder('Home'))),
      );

      expect(find.text('Iniciar sesión'), findsOneWidget);
    });

    testWidgets('L2: password field is hidden initially', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: LoginScreen(homeBuilder: testHomeBuilder('Home'))),
      );

      final field = tester.widget<EditableText>(find.byType(EditableText).last);
      expect(field.obscureText, isTrue);
    });

    testWidgets('L3: show/hide toggles obscuring without changing content', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: LoginScreen(homeBuilder: testHomeBuilder('Home'))),
      );

      await tester.enterText(find.byType(TextFormField).at(1), 'abc123');
      await tester.tap(find.byIcon(Icons.visibility));
      await tester.pump();
      expect(
        (tester.widget<EditableText>(find.byType(EditableText).last))
            .obscureText,
        isFalse,
      );
      expect(find.text('abc123'), findsOneWidget);
    });

    testWidgets('L4: empty submit shows validation errors without navigation', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: LoginScreen(homeBuilder: testHomeBuilder('Home'))),
      );

      await tester.tap(find.text('Iniciar sesión'));
      await tester.pump();
      expect(find.text('El correo es obligatorio'), findsOneWidget);
      expect(find.text('La contraseña es obligatoria'), findsOneWidget);
    });

    testWidgets('L5: invalid email does not navigate', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: LoginScreen(homeBuilder: testHomeBuilder('Home'))),
      );

      await tester.enterText(find.byType(TextFormField).at(0), 'invalid');
      await tester.enterText(find.byType(TextFormField).at(1), 'abc123');
      await tester.tap(find.text('Iniciar sesión'));
      await tester.pump();
      expect(find.text('Ingresa un correo válido'), findsOneWidget);
    });

    testWidgets('L6: valid email and password navigate to home', (
      tester,
    ) async {
      await tester.pumpWidget(const App());

      expect(find.text('Iniciar sesión'), findsOneWidget);

      await tester.enterText(
        find.byType(TextFormField).at(0),
        'test@example.com',
      );
      await tester.enterText(find.byType(TextFormField).at(1), 'secret123');
      await tester.tap(find.text('Iniciar sesión'));
      await tester.pumpAndSettle();

      expect(find.text('Intermedio'), findsWidgets);
      expect(find.text('Iniciar sesión'), findsNothing);

      final navigator = tester.state<NavigatorState>(find.byType(Navigator));
      expect(navigator.canPop(), isFalse);
    });

    testWidgets('L7: Google, Apple and OAuth are absent', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: LoginScreen(homeBuilder: testHomeBuilder('Home'))),
      );

      expect(find.text('Google'), findsNothing);
      expect(find.text('Apple'), findsNothing);
      expect(find.text('OAuth'), findsNothing);
    });

    testWidgets(
      'L8: after successful navigation, login is removed from back stack',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(home: LoginScreen(homeBuilder: testHomeBuilder('Home'))),
        );

        await tester.enterText(
          find.byType(TextFormField).at(0),
          'test@example.com',
        );
        await tester.enterText(find.byType(TextFormField).at(1), 'secret123');
        await tester.tap(find.text('Iniciar sesión'));
        await tester.pumpAndSettle();

        expect(find.text('Home'), findsOneWidget);
        expect(find.text('Iniciar sesión'), findsNothing);
      },
    );

    testWidgets(
      'L9: registration and recovery remain disabled and do not navigate',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(home: LoginScreen(homeBuilder: testHomeBuilder('Home'))),
        );

        final registerText = find.text('Regístrate ahora');
        final recoveryText = find.text('¿Olvidaste tu contraseña?');

        expect(registerText, findsOneWidget);
        expect(recoveryText, findsOneWidget);

        await tester.tap(registerText);
        await tester.tap(recoveryText);
        await tester.pump();

        expect(find.text('Iniciar sesión'), findsOneWidget);
      },
    );
  });
}
