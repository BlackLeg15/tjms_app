import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController {
  final isDark = ValueNotifier(false);

  ThemeController() {
    initTheme();
  }

  Future<void> changeTheme() async {
    isDark.value = !isDark.value;
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('theme', isDark.value);
  }

  Future<void> initTheme() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final value = sharedPreferences.getBool('theme');
    if (value != null) {
      isDark.value = value;
    }
  }
}
