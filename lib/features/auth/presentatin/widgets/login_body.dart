import 'package:flutter/material.dart';
import 'package:fruity_app/constans.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruity_app/core/utils/app_strings.dart';
import 'package:fruity_app/core/utils/app_text_styles.dart';
import 'package:fruity_app/core/widget/custom_button.dart';
import 'package:fruity_app/core/widget/custom_social_button.dart';
import 'package:fruity_app/core/widget/custom_text_form_field.dart';
import 'package:fruity_app/core/widget/password-field.dart';
import '../cubits/signin_cubit/signin_cubit.dart';
import 'dont_have_acc_widget.dart';
import 'or_divider.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
 AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password;
  final GlobalKey<FormState>fromKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: EdgeInsets.symmetric(horizontal: HorizontalPadding),
      child: SingleChildScrollView(
        child: Form(
          key: fromKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              SizedBox(height: 30),
              CustomTextFormField(
                  onSaved: (value) {
                    email=value!;
                  },
                hintText: AppStrings.email,
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),
              PasswordField(
                  onSaved: (value) {
                    password=value!;
                  },

              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    AppStrings.forgetpassword,
                    style: AppTextStyles.cairo600style13green,
                  ),
                ],
              ),
              SizedBox(height: 35),
              CustomButton(onPressed: () {
                if(fromKey.currentState!.validate()){
                  fromKey.currentState!.save();
                  context.read<SigninCubit>().signIn(email, password);

                }else{
                  setState(() {
                    autovalidateMode=AutovalidateMode.always;
                    setState(() {

                    });
                  });
                }
              }, text: AppStrings.signin),
              SizedBox(height: 35),
              DontHaveAccWidget(context),
              SizedBox(height: 35),
              OrDivider(),
              SizedBox(height: 25),
              CustomSocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}
