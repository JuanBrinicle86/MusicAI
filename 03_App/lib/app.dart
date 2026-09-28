import 'package:flutter/material.dart';
import 'package:musicai/home_route/demo_route_data.dart';
import 'package:musicai/home_route/home_route_screen.dart';
import 'package:musicai/login/login_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    const background = Color(0xFF0A0A14);
    const card = Color(0xFF2A1C42);
    const border = Color(0xFF2A2A3D);
    const primary = Color(0xFF8B5CF6);
    const accent = Color(0xFFA78BFA);
    const textPrimary = Color(0xFFF5F5F7);
    const textSecondary = Color(0xFF9494A6);

    return MaterialApp(
      title: 'MusicAI',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: background,
        colorScheme: const ColorScheme.dark(
          primary: primary,
          onPrimary: textPrimary,
          primaryContainer: card,
          onPrimaryContainer: textPrimary,
          secondary: accent,
          onSecondary: background,
          surface: card,
          onSurface: textPrimary,
          surfaceContainerHighest: Color(0xFF17172A),
          onSurfaceVariant: textSecondary,
          outline: border,
          error: Color(0xFFF87171),
        ),
        useMaterial3: true,
        cardTheme: const CardThemeData(
          color: card,
          elevation: 0,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(14)),
            side: BorderSide(color: border),
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: background,
          foregroundColor: textPrimary,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFF0E0E18),
          labelStyle: const TextStyle(color: textSecondary),
          hintStyle: const TextStyle(color: textSecondary),
          prefixIconColor: textSecondary,
          suffixIconColor: textSecondary,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: border),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: accent, width: 1.5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFF87171)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFF87171), width: 1.5),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: accent),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: primary,
            foregroundColor: textPrimary,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      home: LoginScreen(
        homeBuilder: (_) => HomeRouteScreen(levels: demoRouteLevels),
      ),
    );
  }
}
