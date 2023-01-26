import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tjms_app/app/core/theme_controller.dart';
import 'package:tjms_app/app/core/tjms_theme_extension.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Modular.get<ThemeController>();
    return ValueListenableBuilder(
      valueListenable: themeController.isDark,
      builder: (context, isDark, child) {
        final theme = isDark ? ThemeData.dark() : ThemeData.light();
        return MaterialApp.router(
          title: 'Flutter Demo',
          theme: theme.copyWith(
            extensions: const [
              TjmsThemeExtension(),
            ],
          ),
          routerDelegate: Modular.routerDelegate,
          routeInformationParser: Modular.routeInformationParser,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
