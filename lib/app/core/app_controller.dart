import 'dart:async';
import 'dart:ui';

import 'package:flutter/foundation.dart';


abstract class AppController extends ChangeNotifier {
  bool get isDark;
  Locale get locale;

  AppController() {
    initTheme();
  }

  Future<void> changeTheme();

  Future<void> initTheme();

  void switchLocale();
}
