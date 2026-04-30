import 'package:flutter/material.dart';
import 'package:fruity_app/core/functions/build_error_bar.dart';
import 'package:fruity_app/core/utils/app_strings.dart';
import 'package:fruity_app/core/widget/custom_text_form_field.dart';
import 'package:fruity_app/features/auth/presentatin/widgets/terms_and_conditions.dart';
import '../../../../constans.dart';
import '../../../../core/widget/custom_button.dart';
import '../../../../core/widget/password-field.dart';
import '../cubits/signup_cubits/signup_cubit.dart';
import 'have_an_account.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupBody extends StatefulWidget {
  const SignupBody({super.key});

  @override
  State<SignupBody> createState() => _SignupBodyState();
}

class _SignupBodyState extends State<SignupBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String userName, email, password;
  late bool isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: HorizontalPadding),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              SizedBox(height: 30),
              CustomTextFormField(
                onSaved: (value) {
                  userName = value!;
                },
                hintText: AppStrings.thename,
                textInputType: TextInputType.name,
              ),
              SizedBox(height: 20),
              CustomTextFormField(
                onSaved: (value) {
                  email = value!;
                },
                hintText: AppStrings.email,
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20),

              PasswordField(
                onSaved: (value) {
                  password = value!;
                },
              ),
              SizedBox(height: 20),
              TermsAndConditions(
                onChanged: (value) {
                  isTermsAccepted = value;
                },
              ),
              SizedBox(height: 35),
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (isTermsAccepted) {
                      context.read<SignupCubit>().createUserWithEmailAndPassword(
                        email,
                        password,
                        userName,
                      );
                    }else{
                      buildErrorBar(context, 'يجب عليك الموافقة علي الشروط والاحكام');

                    }
                  } else {
                    autovalidateMode = AutovalidateMode.always;

                    setState(() {});
                  }
                },
                text: AppStrings.createnewaccount,
              ),
              SizedBox(height: 35),
              HaveAnAccount(),
            ],
          ),
        ),
      ),
    );
  }
}
