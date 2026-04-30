import 'package:flutter/material.dart';
import 'package:fruity_app/core/utils/App_text_styles.dart';
import 'package:fruity_app/features/best_selling_fruits/presentation/view/best_selling_view.dart';

class BestSelling extends StatelessWidget {
  const BestSelling({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>Navigator.pushNamed(context, BestSellingView.routeName),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'الأ كثر مبيعاً',
            style: AppTextStyles.cairo300style15b.copyWith(fontWeight: FontWeight.w600),
          ),
          Spacer(),
          Text(
            'عرض الكل',
            style: AppTextStyles.cairo700style13lg.copyWith(fontWeight: FontWeight.w400),
          ),

        ],

      ),
    );
  }
}
