import 'package:flutter/material.dart';
import 'package:fruity_app/core/functions/on_generate_route.dart';

import '../features/splash/views/splash_view.dart';

class FruityApp  extends StatelessWidget {
  const FruityApp ({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
    );
  }
}
