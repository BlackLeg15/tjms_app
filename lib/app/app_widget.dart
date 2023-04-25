import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import 'package:tjms_app/app/core/app_controller.dart';
import 'package:tjms_app/app/core/tjms_theme_extension.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    LocalJsonLocalization.delegate.directories = ['lib/app/core/i18n'];

    final themeController = Modular.get<AppController>();
    return AnimatedBuilder(
      animation: themeController,
      builder: (context, child) {
        final theme = themeController.isDark ? ThemeData.dark() : ThemeData.light();

        return MaterialApp.router(
          key: Key(themeController.locale.languageCode),
          title: 'Flutter Demo',
          locale: themeController.locale,
          localizationsDelegates: [
            GlobalWidgetsLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            LocalJsonLocalization.delegate,
          ],
          theme: theme.copyWith(
            extensions: const [
              TjmsThemeExtension(),
            ],
          ),
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('pt', 'BR'),
          ],
          routerDelegate: Modular.routerDelegate,
          routeInformationParser: Modular.routeInformationParser,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
