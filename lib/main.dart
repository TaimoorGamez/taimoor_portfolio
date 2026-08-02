import 'screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'services/responsive_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const Color primaryColor = Color(0xFF0D47A1);

  @override
  Widget build(BuildContext context) {
    return ResponsiveUpdater(
      child: MaterialApp(
        title: 'Taimoor Hussain',
        debugShowCheckedModeBanner: false,
       theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,

        scaffoldBackgroundColor: const Color(0xff0f172a),

        primaryColor: primaryColor,

        colorScheme: ColorScheme.dark(
          primary: primaryColor,
          secondary: primaryColor,
          surface: const Color(0xff0f172a),
        ),

        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          surfaceTintColor: Colors.transparent,
        ),

        cardTheme: CardThemeData(
          color: Colors.white10,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: Colors.white12),
          ),
        ),

        dividerColor: Colors.white12,

        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: TextStyle(
            color: Colors.white70,
            height: 1.7,
          ),
          bodyMedium: TextStyle(
            color: Colors.white70,
            height: 1.6,
          ),
        ),

        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            side: BorderSide(color: primaryColor),
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
          ),
        ),

        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
          ),
        ),

        iconTheme: const IconThemeData(
          color: Colors.white70,
        ),
      ),
        home: const HomeScreen(),
      ),
    );
  }
}

class ResponsiveUpdater extends ConsumerWidget {
  const ResponsiveUpdater({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final Size size = Size(
          constraints.maxWidth,
          constraints.maxHeight,
        );

        WidgetsBinding.instance.addPostFrameCallback((_) {
          ref.read(responsiveProvider.notifier).update(size);
        });

        return child;
      },
    );
  }
}
