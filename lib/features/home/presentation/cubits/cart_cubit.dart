import 'package:bloc/bloc.dart';
import 'package:fruity_app/core/entities/product_input_entity.dart';
import 'package:fruity_app/features/home/domian/entites/cart_entity.dart';
import 'package:fruity_app/features/home/domian/entites/cart_item_entity.dart';
import 'package:meta/meta.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  CartEntity cartEntity = CartEntity([]);

  void addProduct(ProductEntity productEntity) {
    bool isProductExist = cartEntity.isExist(productEntity);
    var carItem=cartEntity.getCartItem(productEntity);
    if (isProductExist) {
      carItem.increaseCount();
    } else {
      cartEntity.addCartItem(carItem);
    }
    emit(CartItemAdded());
  }

  void deletecarItem(CartItemEntity carItem) {
    cartEntity.removeCarItem(carItem);
    emit(CartItemRemoved());

  }

}
