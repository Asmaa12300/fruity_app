import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruity_app/features/home/domian/entites/cart_item_entity.dart';
import 'package:fruity_app/features/home/presentation/widgets/cart_item.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({super.key, required this.cartItems});
final List<CartItemEntity>cartItems;
  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
        separatorBuilder: (context, index) =>
      Divider(
        color: Color(0xFF969899).withOpacity(0.3),
        height: 22,
      ),

    itemCount: cartItems.length,
        itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16) ,
        child: CartItem(
          cartItemEntity: cartItems[index],
        ),
      );
    });

  }
}
