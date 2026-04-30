import 'package:flutter/material.dart';
import 'package:fruity_app/core/entities/product_input_entity.dart';

import 'fruit_item.dart';

class ProductsGridview extends StatelessWidget {
  const ProductsGridview({super.key, required this.products});
final List<ProductEntity>products;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 163/214,
        mainAxisSpacing: 8,
        crossAxisSpacing: 10,
      ),

      itemBuilder: (context, index) {
        return FruitItem(
          productEntity: products[index],
        );
      },
    );
  }
}
