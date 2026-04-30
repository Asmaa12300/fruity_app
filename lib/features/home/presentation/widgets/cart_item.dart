import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruity_app/core/utils/App_colours.dart';
import 'package:fruity_app/core/utils/App_text_styles.dart';
import 'package:fruity_app/core/widget/custom_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruity_app/features/home/domian/entites/cart_item_entity.dart';
import 'package:fruity_app/features/home/presentation/cubits/cart_cubit.dart';
import 'package:fruity_app/features/home/presentation/cubits/cart_item_cubits/cart_item_cubit.dart';
import 'package:fruity_app/features/home/presentation/widgets/cart_action_buttons.dart';
import 'package:fruity_app/generated/assets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItem extends StatelessWidget {
   CartItem({super.key, required this.cartItemEntity});
final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      buildWhen: (prev,current) {
        if (current is CartItemUpdated) {
          if (current.cartItemEntity == cartItemEntity) {
            return true;
          }
        }
        return false;
      },
  builder: (context, state) {
        log('we are building this widget');
    return IntrinsicHeight(
      child: Row(
        children: [
          Container(
            width: 73,
            height: 92,
            decoration: BoxDecoration(color: const Color(0xFFF3F5F7)),
            child: CustomNetworkImage(imageUrl:cartItemEntity.productEntity.imageUrl!),
          ),
          const SizedBox(width: 17),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      cartItemEntity.productEntity.name!,
                      style: AppTextStyles.cairo700style23b.copyWith(
                        fontSize: 13,
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        context.read<CartCubit>().deletecarItem(cartItemEntity);
                      },
                      child: SvgPicture.asset(Assets.outlineTrash),
                    ),
                  ],
                ),
                Text(
                  '${cartItemEntity.calculateTotalWeight()} كم',
                  textAlign: TextAlign.right,
                  style: AppTextStyles.cairo300style15b.copyWith(
                    fontSize: 11,
                    color: AppColors.primaryOrange,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    CartActionButtons(
                      cartItemEntity: cartItemEntity,
                    ),
                    Spacer(),
                    Text(
                      '${cartItemEntity.calculateTotalPrice()} جنيه',
                      style: AppTextStyles.cairo700style23b.copyWith(
                        fontSize: 16,
                        color: AppColors.primaryOrange,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  },
);
  }
}
