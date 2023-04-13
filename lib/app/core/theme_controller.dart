import 'dart:async';

import 'package:flutter/foundation.dart';


abstract class ThemeController {
  ValueNotifier<bool> get isDark;

  ThemeController() {
    initTheme();
  }

  Future<void> changeTheme();

  Future<void> initTheme();
}
