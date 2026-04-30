import 'package:flutter/cupertino.dart';
import 'package:fruity_app/core/products_cubit/products_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/repos/products_repo/products_repo.dart';
import '../../../../core/services/get_it.dart';
import '../widgets/products_body.dart';
class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(
        getIt.get<ProductsRepo>(),
      ),
      child: ProductsBody(),
    );
  }
}
