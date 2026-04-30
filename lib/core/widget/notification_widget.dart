import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../generated/assets.dart';
import '../utils/App_colours.dart';


class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: ShapeDecoration(
        shape: OvalBorder(),
        color: AppColors.white,
      ),
      child: SvgPicture.asset(Assets.imagesNotification),

    );
  }
}
