import 'package:flutter/cupertino.dart';
import 'package:fruity_app/core/functions/build_error_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/cart_cubit.dart';
import 'main_view_body.dart';

class MainViewBodyBlocConsumer extends StatelessWidget {
  const MainViewBodyBlocConsumer({super.key, required this.currentIndex});
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartItemAdded) {
          buildErrorBar(context, 'تمت العمليه بنجاح');
        }
        if (state is CartItemRemoved) {
          buildErrorBar(context, 'تم حذف  العنصر بنجاح');
        }
      },
      child: MainViewBody(currentIndex: currentIndex),
    );
  }
}
