import 'package:equatable/equatable.dart';
import 'package:fruity_app/core/entities/product_input_entity.dart';

class CartItemEntity extends Equatable{
  final ProductEntity productEntity;
  int count;

  CartItemEntity(
      {
        required this.productEntity,
        this.count = 0
      });

  num calculateTotalPrice() {
    return productEntity.price * count;
  }

  num calculateTotalWeight() {
    return productEntity.unitAmount * count;
  }

  increaseCount() {
    count++;
  }

  decreaseCount() {
    count--;
  }

  @override
   List<Object?> get props => [productEntity];
}
