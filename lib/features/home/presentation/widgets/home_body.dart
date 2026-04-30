import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../../../core/products_cubit/products_cubit.dart';
import '../../../../core/widget/search_text_field.dart';
import 'best_selling.dart';
import 'Products_gridview.dart';
import 'products_grid_view_bloc_builder.dart';
import 'custom_home_app_bar.dart';
import 'featured_list.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override

  void initState() {
    context.read<ProductsCubit>().getProducts();
    super.initState();
  }
  Widget build(BuildContext context) {
    return Padding (
      padding: const EdgeInsets.symmetric(horizontal: 16) ,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 16),
                CustomHomeAppBar(),
                SizedBox(height: 16),
                SearchTextField(),
                SizedBox(height: 16),
                FeaturedList(),
                SizedBox(height: 12),
                BestSelling(),
                SizedBox(height: 8),
              ],
            ),
          ),
          ProductsGridViewBlocBuilder(),

        ],

      ),

    );
  }
}

