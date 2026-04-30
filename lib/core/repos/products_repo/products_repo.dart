 import '../../entities/product_input_entity.dart';
import '../../errors/exceptions.dart';
import '../../errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class ProductsRepo{
  Future<Either<Failure, List<ProductEntity>>> getProducts();
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts();

}