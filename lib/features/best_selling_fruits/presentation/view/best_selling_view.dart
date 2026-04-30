import 'package:flutter/material.dart';
import 'package:fruity_app/core/widget/build_app_bar.dart';
import 'package:fruity_app/features/best_selling_fruits/widgets/best_selling_view_body.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});
static const routeName = 'best_selling_view';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: buildAppBar(context,title: '   الأكثر  مبيعاً '),
      body: BestSellingViewBody(),
    );
  }
}
