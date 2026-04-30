import 'package:flutter/material.dart';

import '../utils/App_colours.dart';

OutlineInputBorder buildOutlineInputBorder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(
        width: 2,
        color: AppColors.primaryGrey.withOpacity(0.5),
      )
  );
}
