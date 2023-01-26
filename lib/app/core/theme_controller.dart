import 'package:flutter/material.dart';

class ThemeController extends InheritedWidget {
  final isDark = ValueNotifier(false);

  ThemeController({super.key, required super.child});

  void changeTheme() {
    isDark.value = !isDark.value;
  }

  static ThemeController of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<ThemeController>()!;

  @override
  bool updateShouldNotify(covariant ThemeController oldWidget) {
    return oldWidget.isDark != isDark;
  }
}
