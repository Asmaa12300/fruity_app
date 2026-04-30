import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruity_app/features/auth/presentatin/view/login_view.dart';
import 'package:fruity_app/features/auth/presentatin/view/login_view.dart';
import 'package:fruity_app/features/on_boarding/presentation/view/widgets/on_boarding_view.dart';
import 'package:fruity_app/features/splash/views/splash_view.dart';
import '../../features/auth/presentatin/view/signup_view.dart';
import '../../features/best_selling_fruits/presentation/view/best_selling_view.dart';
import '../../features/home/presentation/view/main_view.dart';
import '../../features/home/presentation/widgets/home_View.dart';



Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => SplashView());

    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => LoginView());
    case SignupView.routeName:
      return MaterialPageRoute(builder: (context) => SignupView());
    case MainView.routeName:
      return MaterialPageRoute(builder: (context) => MainView());
    case BestSellingView.routeName:
      return MaterialPageRoute(builder: (context) => BestSellingView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => OnBoardingView());

    default:
      return MaterialPageRoute(builder: (context) => HomeView());
  }
}
