import '../entities/review_entity.dart';

class ReviewModel {
  final String name;
  final String image;
  final String date;
  final num ratting;
  final String reviewDescription;

  ReviewModel({
    required this.name,
    required this.image,
    required this.date,
    required this.ratting,
    required this.reviewDescription
  });
  factory ReviewModel.fromEntity(ReviewEntity reviewEntity) {
    return ReviewModel(
      name: reviewEntity.name,
      image: reviewEntity.image,
      date: reviewEntity.date,
      ratting: reviewEntity.ratting,
      reviewDescription: reviewEntity.reviewDescription
    );
  }
  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      name: json['name'],
      image: json['image'],
      date: json['date'],
      ratting: json['ratting'],
      reviewDescription: json['reviewDescription']
    );
  }
  ReviewEntity toEntity() {
    return ReviewEntity(
      name: name,
      image: image,
      date: date,
      ratting: ratting,
      reviewDescription: reviewDescription
    );
  }
  toJson() {
    return {
      'name': name,
      'image': image,
      'date': date,
      'ratting': ratting,
      'reviewDescription': reviewDescription
    };
  }
}