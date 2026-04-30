import 'package:flutter/material.dart';
import 'package:fruity_app/core/utils/App_colours.dart';
import 'package:fruity_app/core/utils/app_strings.dart';
import 'package:fruity_app/core/utils/app_text_styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: AppColors.primaryGrey.withOpacity(0.5))),
        SizedBox(width: 16),
        Text(
          AppStrings.or,
          style: AppTextStyles.cairo300style15b.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 17,
          ),
        ),
        SizedBox(width: 16),

        Expanded(child: Divider(color: AppColors.primaryGrey.withOpacity(0.5))),
      ],
    );
  }
}
