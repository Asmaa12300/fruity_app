import 'package:flutter/cupertino.dart';
import 'package:fruity_app/features/home/presentation/cubits/cart_item_cubits/cart_item_cubit.dart';
import 'package:fruity_app/features/home/presentation/widgets/cart_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartItemCubit(),
      child: CartBody(),
    );
  }
}
