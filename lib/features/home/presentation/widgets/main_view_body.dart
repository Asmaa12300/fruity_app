import 'package:flutter/cupertino.dart';

import '../view/cart_view.dart';
import '../view/product_view.dart';
import 'home_View.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({
    super.key,
    required this.currentIndex,
  });

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: currentIndex,
      children: [HomeView(), ProductView(), CartView()],
    );
  }
}
