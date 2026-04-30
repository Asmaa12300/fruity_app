
import 'package:fruity_app/core/entities/review_entity.dart';

num getAvgRating( List<dynamic>reviews) {
  var sum =0.0;

  for (var review in reviews) {
    sum += review.ratting;
  }
  return sum /reviews.length;
}
