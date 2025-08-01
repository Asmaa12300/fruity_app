import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruity_app/features/on_boarding/presentation/view/widgets/on_boarding_view.dart';
import 'package:fruity_app/generated/assets.dart';


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
          mainAxisAlignment: MainAxisAlignment.start,
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
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
    });
  }
}
