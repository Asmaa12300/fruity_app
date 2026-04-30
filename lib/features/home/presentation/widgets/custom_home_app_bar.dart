import 'package:flutter/material.dart';
import 'package:fruity_app/core/utils/App_colours.dart';
import 'package:fruity_app/core/utils/app_text_styles.dart';
import 'package:fruity_app/core/widget/notification_widget.dart';
import 'package:fruity_app/generated/assets.dart';

import '../../../../core/functions/get_user.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: NotificationWidget(),
      leading: Image.asset(Assets.imagesMaskgroup),
      title: Text(
        'صباح الخير!..',
        textAlign: TextAlign.right,
        style: AppTextStyles.cairo300style15b.copyWith(
          color: AppColors.primaryGrey,
        ),
      ),
      subtitle: Text(
       getUser().name,
        textAlign: TextAlign.right,
        style: AppTextStyles.cairo700style23b.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
