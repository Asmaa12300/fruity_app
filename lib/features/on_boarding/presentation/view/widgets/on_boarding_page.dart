import 'package:flutter/material.dart';
import 'package:fruity_app/core/utils/app_strings.dart';
import 'package:fruity_app/core/utils/app_text_styles.dart';
import 'package:fruity_app/features/on_boarding/presentation/view/widgets/page_item.dart';

import '../../../../../generated/assets.dart';
import '../../../../auth/presentatin/view/login_view.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: pageController,
          children: [
            PageItem(
              isVisible: true,
              image: Assets.imagesFruitbasketamico,
              backgroundImage: Assets.imagesVectored,
              subtitle: AppStrings.fruitsubtitle,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppStrings.hello, style: AppTextStyles.cairo700style23b),
                  Text(AppStrings.hub, style: AppTextStyles.cairo700style23o),
                  Text(AppStrings.fruit, style: AppTextStyles.cairo700style24g),
                ],
              ),
            ),
            PageItem(
              isVisible: false,
              image: Assets.imagesPineapplecuate,
              backgroundImage: Assets.imagesVectorgreen,
              subtitle:
                  'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('ابحث وتسوق', style: AppTextStyles.cairo700style23b),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
