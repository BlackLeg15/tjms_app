import 'dart:async';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_controller.dart';

class AppControllerImp extends ChangeNotifier implements AppController {
  AppControllerImp() {
    initTheme();
  }

  @override
  Future<void> changeTheme() async {
    isDark = !isDark;
    notifyListeners();
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('theme', isDark);
  }

  @override
  Future<void> initTheme() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final value = sharedPreferences.getBool('theme');
    if (value != null) {
      isDark = value;
      notifyListeners();
    }
  }

  @override
  bool isDark = false;

  @override
  Locale locale = const Locale('en', 'US');

  @override
  void switchLocale() {
    if (locale.languageCode == 'en') {
      locale = const Locale('pt', 'BR');
    } else {
      locale = const Locale('en', 'US');
    }
    notifyListeners();
  }
}
