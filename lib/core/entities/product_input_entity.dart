import 'package:equatable/equatable.dart';
import 'package:fruity_app/core/entities/review_entity.dart';


class ProductEntity extends Equatable {
  final String name;
  final String code;
  final String description;
  final num price;
  final bool isFeatured;
  String? imageUrl;
  final int expirationsMonths;
  final bool isOrganic ;
  final int numberOfCalories;
  final num avgRating =0;
  final int ratingCount =0;
  final int unitAmount;
  final  List<ReviewEntity> reviews ;

  ProductEntity({

    required this.reviews,
    required this.code,
    required this.name,
    required this.description,
    required this.price,
    required this.expirationsMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    this.isOrganic= false,
    required this.isFeatured,
    this.imageUrl,
  });

  @override
  List<Object?> get props => [code];
}
