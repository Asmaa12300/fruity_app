import 'package:flutter/material.dart';
import '../utils/App_colours.dart';
import '../utils/app_strings.dart';
import 'custom_text_form_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key, this.onSaved,
  });

  final void Function(String?)? onSaved;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      obscureText: obscureText,
      onSaved: (value) {
        widget.onSaved!(value);
      },
      suffixIcon: GestureDetector(
        onTap: (){
          setState(() {
            obscureText = !obscureText;
          });
        },
        child: obscureText? Icon(
          Icons.visibility_off_outlined,
          color: AppColors.primaryGrey,
        ): Icon(
          Icons.visibility_outlined,
          color: AppColors.primaryGrey,
        ),
      ),
      hintText: AppStrings.password,
      textInputType: TextInputType.visiblePassword,
    );
  }
}
