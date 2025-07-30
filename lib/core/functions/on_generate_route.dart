import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruity_app/features/on_boarding/presentation/view/widgets/on_boarding_view.dart';
import 'package:fruity_app/features/splash/views/splash_view.dart';
Route<dynamic> onGenerateRoute(RouteSettings settings){
switch(settings.name){
  case SplashView.routeName:
    return MaterialPageRoute(builder: (context)=>SplashView());

case OnBoardingView.routeName:
return MaterialPageRoute(builder: (context)=>OnBoardingView());

default:
    return MaterialPageRoute(builder: (context) =>Scaffold());
}
}