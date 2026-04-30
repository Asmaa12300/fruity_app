import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruity_app/constans.dart';
import 'package:fruity_app/core/services/firebase_auth.dart';
import 'package:fruity_app/core/services/shared_prefrences_singlton.dart';
import 'package:fruity_app/features/auth/presentatin/view/login_view.dart';
import 'package:fruity_app/features/on_boarding/presentation/view/widgets/on_boarding_view.dart';
import 'package:fruity_app/generated/assets.dart';

import '../home/presentation/view/main_view.dart';


class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  @override
  void initState() {
    excuteNavigation();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(Assets.imagesPlant),
          ],
        ),
        SvgPicture.asset(Assets.imagesFruitHup),
        SvgPicture.asset(Assets.imagesCircles,),

      ],
    );
  }

  void excuteNavigation() {
    bool isOnBoardingSeen = SharedPreferencesSingleton.getBool(KIsOnBoardingSeen);
    Future.delayed(Duration(seconds: 3),(){
      if (isOnBoardingSeen) {
        var isLoggedIn = FireBaseAuthService().isLoggedIn();
        if(isLoggedIn){
          Navigator.pushReplacementNamed(context, MainView.routeName);
        }else{
          Navigator.pushReplacementNamed(context, LoginView.routeName);
        }

      }else{
        Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
      }
    });
  }
}///tomam zory😂😂
