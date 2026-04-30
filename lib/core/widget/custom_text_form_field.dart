import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruity_app/core/utils/App_colours.dart';
import 'package:fruity_app/core/utils/app_strings.dart';

import '../utils/app_text_styles.dart';
import 'custom_build_border.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    required this.textInputType,
    this.suffixIcon, this.onSaved,  this.obscureText=false,
  });

  final String? hintText;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  final void Function(String?)? onSaved;
  final bool obscureText ;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      onSaved: onSaved,
      validator:( value) {
        if (value == null || value.isEmpty) {
          return AppStrings.pleasefilloutthisfield;
        }
        return null;
      },

      keyboardType: textInputType,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintStyle: AppTextStyles.cairo700style13lg.copyWith(),
        hintText: hintText,
        filled: true,
        fillColor: AppColors.fieldColour,
        border: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
      ),
    );
  }
}
