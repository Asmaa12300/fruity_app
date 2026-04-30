import 'package:flutter/material.dart';
import 'package:fruity_app/core/products_cubit/products_cubit.dart';
import 'package:fruity_app/core/repos/products_repo/products_repo.dart';
import '../../../../core/services/get_it.dart';
import 'home_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(getIt.get<ProductsRepo>()),
      child: HomeViewBody(),
    );
  }

}



