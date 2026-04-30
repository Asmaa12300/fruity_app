import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruity_app/constans.dart';
import 'package:fruity_app/core/services/shared_prefrences_singlton.dart';
import 'package:fruity_app/core/utils/App_colours.dart';
import 'package:fruity_app/core/widget/custom_button.dart';
import 'package:fruity_app/features/on_boarding/presentation/view/widgets/on_boarding_page.dart';

import '../../../../auth/presentatin/view/login_view.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  @override
  late PageController pageController;
  var currentPage = 0;

  @override
  void initState() {
    super.initState();

    pageController = PageController();
    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
    });
  }

  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: OnBoardingPage(pageController: pageController)),
        DotsIndicator(
          dotsCount: 2,
          position: 0,
          decorator: DotsDecorator(
            activeColor: AppColors.primaryColour,
            color: currentPage == 1
                ? AppColors.primaryColour
                : AppColors.primaryColour.withOpacity(0.5),
          ),
        ),
        SizedBox(height: 24),
        Visibility(
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          visible: currentPage == 1 ? true : false,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: HorizontalPadding,
              vertical: VerticalPadding,
            ),
            child: CustomButton(
              onPressed: () {
                SharedPreferencesSingleton.setBool(KIsOnBoardingSeen, true);
                Navigator.of(context).pushReplacementNamed(LoginView.routeName);
              },
              text: ' تسوق  الأن ',
            ),
          ),
        ),

        SizedBox(height: 45),
      ],
    );
  }
}
