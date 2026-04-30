import 'package:flutter/material.dart';
import 'package:fruity_app/core/utils/App_text_styles.dart';
import 'package:fruity_app/features/best_selling_fruits/presentation/view/best_selling_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../generated/assets.dart';
class  ProductsHeader extends StatelessWidget {
  const  ProductsHeader({super.key, required this.ProductsLength});
final int ProductsLength;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '  ${ProductsLength}نتائج  ',
          style: AppTextStyles.cairo300style15b.copyWith(fontWeight: FontWeight.w600),
        ),
        Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: ShapeDecoration(
            color: Colors.white.withValues(alpha: 0.10),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: const Color(0x66CACECE),
              ),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: SvgPicture.asset(Assets.boldArrowSwapHorizontal),

        )


      ],

    );
  }
}
