import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruity_app/features/auth/presentatin/view/signup_view.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_text_styles.dart';


Text DontHaveAccWidget(BuildContext context) {
  return Text.rich(
    TextSpan(
      children: [
        TextSpan(
          text: AppStrings.dontalreadyhaveaccount,
          style: AppTextStyles.cairo700style13lg.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextSpan(
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Navigator.pushNamed(
                context,
                SignupView.routeName,
              );
            },
          text: AppStrings.createnewaccount,
          style: AppTextStyles.cairo700style24g.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),

      ],
    ),

  );
}