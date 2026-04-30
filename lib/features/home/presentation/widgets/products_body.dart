import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruity_app/core/widget/build_app_bar.dart';
import 'package:fruity_app/features/home/presentation/widgets/products_header.dart';
import '../../../../core/products_cubit/products_cubit.dart';
import '../../../../core/widget/search_text_field.dart';
import 'best_selling.dart';
import 'products_grid_view_bloc_builder.dart';
import 'custom_home_app_bar.dart';

class ProductsBody extends StatefulWidget {
  const ProductsBody({super.key});

  @override
  State<ProductsBody> createState() => _ProductsBodyState();
}

class _ProductsBodyState extends State<ProductsBody> {
  void initState() {
    super.initState();
    context.read<ProductsCubit>().getProducts();
  }
  @override

  Widget build(BuildContext context) {
    return Padding (
      padding: const EdgeInsets.symmetric(horizontal: 16) ,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 16),
                buildAppBar(context, title: 'المنتجات',showBackButton: false),

                SizedBox(height: 16),
                SearchTextField(),
                SizedBox(height: 16),
                ProductsHeader(
                  ProductsLength:context.read<ProductsCubit>().productsLength  ,
                ),
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