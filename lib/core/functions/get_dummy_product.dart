import 'dart:io';


import '../entities/product_input_entity.dart';

ProductEntity getDummyProduct() {
  return ProductEntity(
    code: 'FRU123',
    name: 'Fresh Apple',
    description: 'A delicious and juicy fresh apple.',
    price: 1.99,
    isFeatured: true,
    expirationsMonths: 2,
    numberOfCalories: 95,
    unitAmount: 1,
    reviews: [],
    isOrganic: true,
    imageUrl: ('https://www.bigfootdigital.co.uk/wp-content/uploads/2020/07/image-optimisation-scaled.jpg'),
  );
}
List<ProductEntity>getDummyProducts(){
  return [
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
];
}