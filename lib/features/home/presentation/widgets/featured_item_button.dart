import 'package:flutter/material.dart';
import '../../../../core/utils/App_colours.dart';
import '../../../../core/utils/App_text_styles.dart';

class FeaturedItemButton extends StatelessWidget {
  const FeaturedItemButton({super.key, required this.onPressed});
final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 32,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24,),
          child: FittedBox(
            child: Text('تسوق الان',
              style: AppTextStyles.cairo600style13green),
          ),
        ),
      ),
    );
  }
}
