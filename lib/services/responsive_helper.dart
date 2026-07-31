import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final responsiveProvider = NotifierProvider<ResponsiveNotifier, ResponsiveState>(
  ResponsiveNotifier.new,
);

class ResponsiveNotifier extends Notifier<ResponsiveState> {
  @override
  ResponsiveState build() {
    return _create(
      width: 390,
      height: 844,
    );
  }

  void update(Size size) {
    final ResponsiveState next = _create(
      width: size.width,
      height: size.height,
    );

    if (next.screenWidth != state.screenWidth ||
        next.screenHeight != state.screenHeight) {
      state = next;
    }
  }

  ResponsiveState _create({
    required double width,
    required double height,
  }) {
    final bool mobile = width < 700;
    final bool tablet = width >= 700 && width < 1200;
    final bool desktop = width >= 1200;

    final double contentWidth = desktop
        ? 1280
        : tablet
            ? 900
            : width;

    final double horizontalPadding = 20;

    double clamp(double value, double min, double max) {
      if (value < min) return min;
      if (value > max) return max;
      return value;
    }

    // Layout scale (capped)
    final double unit = clamp(contentWidth / 390, 1.0, 2.5);

    // Typography scale (independent)
    final double textScale = clamp(width / 390, 1.0, 2.0);

    return ResponsiveState(
      screenWidth: width,
      screenHeight: height,

      isMobile: mobile,
      isTablet: tablet,
      isDesktop: desktop,

      contentWidth: contentWidth,
      horizontalPadding: horizontalPadding,

      unit: unit,

      // Typography
      h1: clamp(34 * textScale, 34, 70),
      h2: clamp(26 * textScale, 24, 50),
      h3: clamp(20 * textScale, 20, 30),
      body: clamp(16 * textScale, 16, 20),
      small: clamp(14 * textScale, 14, 18),

      // Layout
      radius: clamp(unit * 12, 12, 24),
      gap: clamp(unit * 20, 12, 24),
    );
  }

}

class ResponsiveState {
  const ResponsiveState({
    required this.screenWidth,
    required this.screenHeight,

    required this.isMobile,
    required this.isTablet,
    required this.isDesktop,

    required this.contentWidth,
    required this.horizontalPadding,

    required this.unit,

    required this.h1,
    required this.h2,
    required this.h3,
    required this.body,
    required this.small,

    required this.radius,
    required this.gap,
  });

  final double screenWidth;
  final double screenHeight;

  final bool isMobile;
  final bool isTablet;
  final bool isDesktop;

  final double contentWidth;
  final double horizontalPadding;

  final double unit;

  final double h1;
  final double h2;
  final double h3;
  final double body;
  final double small;

  final double radius;
  final double gap;
}
