import 'dart:io';
import 'package:fruity_app/core/entities/review_entity.dart';
import 'package:fruity_app/core/models/review_model.dart';
import '../entities/product_input_entity.dart';
import 'package:fruity_app/core/models/product_model.dart';

import '../functions/get_avgrating.dart';

class ProductModel {
  final String name;
  final String code;
  final String description;
  final num price;
  final bool isFeatured;
  final num sellingCount ;
  final String? imageUrl;
  final int expirationsMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final int ratingCount = 0;
  final int unitAmount;
  final List <ReviewModel> reviews ;

  ProductModel({
    required this.reviews,
    required this.code,
    required this.name, 
    required this.description,
    required this.price,
    required this.isOrganic ,
    required this.expirationsMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.sellingCount,
    required this.isFeatured,
    this.imageUrl,
  });

 factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      code: json['code'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      isFeatured: json['isFeatured'],
      imageUrl: json['imageUrl'],
      expirationsMonths: json['expirationsMonths'],
      isOrganic: json['isOrganic'],
      numberOfCalories: json['numberOfCalories'],
      unitAmount: json['unitAmount'],
      sellingCount: json['sellingCount'] ,
      reviews: json['reviews'] != null
          ? List<ReviewModel>.from(
              json['reviews'].map((e) => ReviewModel.fromJson(e)))
          :[],

    );
  }
 ProductEntity toEntity() {
    return ProductEntity(
      imageUrl: imageUrl,
      code: code,
      name: name,
      description: description,
      price: price,
      isOrganic: isOrganic,
      expirationsMonths: expirationsMonths,
      numberOfCalories: numberOfCalories,
      unitAmount: unitAmount,
      isFeatured: isFeatured,
      reviews: reviews.map((e) => e.toEntity()).toList(),
    );
  }

  toJson() {
    return {
      'code': code,
      'name': name,
      'description': description,
      'price': price,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'expirationsMonths': expirationsMonths,
      'isOrganic': isOrganic,
      'numberOfCalories': numberOfCalories,
      'ratingCount': ratingCount,
      'unitAmount': unitAmount,
      'reviews': reviews.map((e) => e.toJson()).toList(),

    };
  }
}

