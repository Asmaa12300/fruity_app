import 'package:flutter/material.dart';
import 'App_colours.dart';


abstract class AppTextStyles {
  static final cairo700style24g = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryColour,
  );
  static final cairo700style23b = TextStyle(
    fontSize: 23,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryBlack,
  );
  static final cairo700style23o = TextStyle(
    fontSize: 23,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryOrange,
  );
  static final cairo300style15b = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w300,
    color: AppColors.primaryBlack,
  );
  static final cairo500style16w = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );
  static final cairo600style13green = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: AppColors.secoundaryColour,
  );
  static final cairo700style13lg = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryGrey,
  );


}