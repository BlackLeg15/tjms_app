import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'theme_controller.dart';

class ThemeControllerImp implements ThemeController {
  ThemeControllerImp() {
    initTheme();
  }

  @override
  Future<void> changeTheme() async {
    isDark.value = !isDark.value;
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('theme', isDark.value);
  }

  @override
  Future<void> initTheme() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final value = sharedPreferences.getBool('theme');
    if (value != null) {
      isDark.value = value;
    }
  }

  @override
  ValueNotifier<bool> get isDark => ValueNotifier<bool>(false);
}
