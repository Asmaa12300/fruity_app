import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruity_app/core/functions/on_generate_route.dart';
import 'package:fruity_app/core/utils/App_colours.dart';
import '../features/splash/views/splash_view.dart';
import '../generated/l10n.dart';

class FruityApp extends StatelessWidget {
  const FruityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      supportedLocales: S.delegate.supportedLocales,
      locale: Locale('ar'),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      theme: ThemeData(
        fontFamily: "Cairo",
        primaryColor: AppColors.primaryColour,
      ),
      initialRoute: SplashView.routeName,
    );
  }
}
