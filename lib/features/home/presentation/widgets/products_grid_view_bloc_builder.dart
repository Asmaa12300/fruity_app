import 'package:flutter/cupertino.dart';
import 'package:fruity_app/core/functions/get_dummy_product.dart';
import 'package:fruity_app/core/products_cubit/products_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruity_app/core/widget/custom_error_widget.dart';
import 'Products_gridview.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductsGridViewBlocBuilder extends StatelessWidget {
  const ProductsGridViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return ProductsGridview(products: state.products);
        } else if (state is ProductsFailure) {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(text: state.errMassage),
          );
        } else {
          return Skeletonizer.sliver(
            enabled: true,
            child: ProductsGridview(products: getDummyProducts()),
          );
        }
      },
    );
  }
}
