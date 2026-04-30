import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:fruity_app/core/models/product_model.dart';
import 'package:fruity_app/core/repos/products_repo/products_repo.dart';
import 'package:fruity_app/core/services/database_service.dart';
import 'package:fruity_app/core/utils/backend_endpoint.dart';
import '../../entities/product_input_entity.dart';
import '../../errors/failures.dart';

class ProductRepoImpl extends ProductsRepo {
  final DatabaseService databaseService;

  ProductRepoImpl(this.databaseService);

  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() async {
    try {
      var data =
          await databaseService.getUserData(
                path: BackendEndpoint.getProducts,
                query: {
                  'limit': 10,
                  'orderBy': 'uintAmount',
                  'descending': true,
                },
              )
              as List<Map<String, dynamic>>;
      if (kDebugMode) {
        print("data before signed to entity =${data.length}");
      }
      List<ProductEntity> products = data
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList();
      return right(products);
    } on Exception catch (e) {
      return left((ServerFailure('Failed to get products')));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var data =
          await databaseService.getUserData(path: BackendEndpoint.getProducts)
              as List<Map<String, dynamic>>;


      List<ProductEntity> products = data
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList();
      return right(products);
    } on Exception catch (e) {
      return left((ServerFailure('Failed to get products')));
    }
  }
}
