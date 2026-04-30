import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../view/login_view.dart';

class HaveAnAccount extends StatelessWidget {
  const HaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: AppStrings.alreadyhaveanaccount,
            style: AppTextStyles.cairo700style13lg.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
              Navigator.pop(context);
              },
            text: AppStrings.signin,
            style: AppTextStyles.cairo700style24g.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),

        ],
      ),

    );
  }
}
