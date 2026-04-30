import 'package:fruity_app/core/entities/product_input_entity.dart';
import 'package:fruity_app/features/home/domian/entites/cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity>cartItems;

  CartEntity(this.cartItems);

  addCartItem(CartItemEntity cartItemEntity) {
    cartItems.add(cartItemEntity);
  }
removeCarItem(CartItemEntity carItem) {
    cartItems.remove(carItem);
  }

  double calculateTotalPrice() {
    double totalPrice = 0.0;
    for (var cartItem in cartItems) {
      totalPrice += cartItem.calculateTotalPrice() ;
    }
    return totalPrice;
  }

  bool isExist(ProductEntity product)
  {
    for (var carItem in cartItems) {
      if (carItem.productEntity == product) {
        return true;

      }
    }
    return false;
  }
  CartItemEntity getCartItem(ProductEntity product) {
    for (var carItem in cartItems) {
      if (carItem.productEntity == product) {
        return carItem;
      }
    }
    return CartItemEntity(productEntity: product, count: 1);
  }
  }