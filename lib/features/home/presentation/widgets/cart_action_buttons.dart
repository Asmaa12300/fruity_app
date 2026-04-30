import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruity_app/core/utils/App_text_styles.dart';
import 'package:fruity_app/features/home/domian/entites/cart_item_entity.dart';
import 'package:fruity_app/features/home/presentation/cubits/cart_item_cubits/cart_item_cubit.dart';
import'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/App_colours.dart';

class CartActionButtons extends StatelessWidget {
  const CartActionButtons({super.key, required this.cartItemEntity});
final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CartButton(
          icon: Icons.add,
          color: AppColors.secoundaryColour,
          iconColore: AppColors.fieldColour,
          onPressed: () {
            cartItemEntity.increaseCount();
            context.read<CartItemCubit>().updateCartItem(cartItemEntity);
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            cartItemEntity.count.toString(),
            textAlign: TextAlign.center,
            style: AppTextStyles.cairo700style23b.copyWith(fontSize: 16)
            ),
        ),


        CartButton(
          icon: Icons.remove,
          color: AppColors.white,
          iconColore: AppColors.primaryGrey,
          onPressed: () {
            cartItemEntity.decreaseCount();
            context.read<CartItemCubit>().updateCartItem(cartItemEntity);

          },
        ),

      ],
    );
  }
}

class CartButton extends StatelessWidget {
  const CartButton({
    super.key,
    required this.icon,
    required this.color,
    required this.onPressed,
    required this.iconColore,
  });

  final IconData icon;
  final Color iconColore;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 24,
        height: 24,
        padding: EdgeInsets.all(2),
        decoration: ShapeDecoration(
          color: color /* Green1-500 */,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        ),
        child: FittedBox(child: Icon(icon, color: iconColore)),
      ),
    );
  }
}
