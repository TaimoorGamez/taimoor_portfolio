import 'screens.dart';
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
          colorSchemeSeed: primaryColor,
          appBarTheme: const AppBarTheme(
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
            centerTitle: true,
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
