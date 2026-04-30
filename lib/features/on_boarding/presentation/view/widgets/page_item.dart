import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruity_app/core/utils/app_strings.dart';
import 'package:fruity_app/features/auth/presentatin/view/login_view.dart';
import '../../../../../constans.dart';
import '../../../../../core/services/shared_prefrences_singlton.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../generated/assets.dart';

class PageItem extends StatelessWidget {
  const PageItem({
    super.key,
    required this.image,
    required this.backgroundImage,
    required this.subtitle,
    required this.title,
    required this.isVisible,
  });

  final String image, backgroundImage;
  final String subtitle;
  final Widget title;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: Opacity(
                  opacity: 0.5,
                  child: SvgPicture.asset(backgroundImage, fit: BoxFit.fill),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: SvgPicture.asset(image),
              ),
              Visibility(
                visible: isVisible,
                child: GestureDetector(
                  onTap: () {
                    SharedPreferencesSingleton.setBool(KIsOnBoardingSeen, true);

                    Navigator.of(
                      context,
                    ).pushReplacementNamed(LoginView.routeName);
                  },

                  child: Text(
                    AppStrings.skip,
                    style: AppTextStyles.cairo300style15b,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 46),
        title,
        SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: AppTextStyles.cairo300style15b,
          ),
        ),
      ],
    );
  }
}
