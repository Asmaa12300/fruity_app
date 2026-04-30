import 'package:flutter/material.dart';
import 'package:fruity_app/core/utils/app_text_styles.dart';
import 'package:fruity_app/generated/assets.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import 'featured_item_button.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});
  @override
  Widget build(BuildContext context) {
    var itemwidth = MediaQuery.sizeOf(context).width-32;
    return SizedBox(
      width: itemwidth,
      child: AspectRatio(
        aspectRatio: 342/158,
        child: Stack(
          children: [

            Positioned(
                left: 0,
                bottom: 0,
                top: 0,
                right: itemwidth*0.4,
                child: Image.asset(Assets.imagesAvocadoPNGClipart1,fit: BoxFit.fill,)),
            Container(

              width: itemwidth*0.5,
              decoration:BoxDecoration(
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(6),topRight: Radius.circular(6)),
                image: DecorationImage(image: Svg(Assets.imagesEllipse224), fit: BoxFit.fill),
              ) ,
              child: Padding(
                padding: const EdgeInsets.only(right: 33,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 25,),
                    Text(
                      'عروض العيد',
                      style: AppTextStyles.cairo500style16w.copyWith(fontSize: 13),
                    ),
                    Spacer(),

                    Text(
                      'خصم 25%',
                      style: AppTextStyles.cairo500style16w.copyWith(
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height:11,),
                    FeaturedItemButton(onPressed: (){},),
                    SizedBox(height: 29,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
