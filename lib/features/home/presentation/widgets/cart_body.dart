import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruity_app/features/home/presentation/cubits/cart_cubit.dart';
import 'package:fruity_app/features/home/presentation/widgets/cart_header.dart';
import 'package:fruity_app/features/home/presentation/widgets/cart_items_list.dart';
import '../../../../core/widget/build_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'custtom_cart_button.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: 16),
                  buildAppBar(
                    context,
                    title: 'السلة',
                    showNotificatonButton: false,
                  ),
                  SizedBox(height: 16),
                  CartHeader(),
                  SizedBox(height: 16),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: context.read<CartCubit>().cartEntity.cartItems.isEmpty
                  ? SizedBox()
                  : Divider(
                      color: Color(0xFF969899).withOpacity(0.3),
                      height: 22,
                    ),
            ),

            CartItemsList(
                cartItems: context.watch<CartCubit>().cartEntity.cartItems,
            ),
            SliverToBoxAdapter(
              child: context.read<CartCubit>().cartEntity.cartItems.isEmpty
                  ? SizedBox()
                  : Divider(
                      color: Color(0xFF969899).withOpacity(0.3),
                      height: 22,
                    ),
            ),
          ],
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: MediaQuery.sizeOf(context).height * 0.05,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomCartButton(),
          ),
        ),
      ],
    );
  }
}

