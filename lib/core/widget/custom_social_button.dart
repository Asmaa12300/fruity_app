import 'package:flutter/material.dart';
import 'package:fruity_app/core/utils/app_strings.dart';
import 'package:fruity_app/features/auth/presentatin/cubits/signin_cubit/signin_cubit.dart';
import 'package:fruity_app/features/auth/presentatin/widgets/login_apple.dart';
import 'package:fruity_app/features/auth/presentatin/widgets/login_facebook.dart';
import 'package:fruity_app/features/auth/presentatin/widgets/login_google.dart';
import '../../generated/assets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CustomSocialButton extends StatelessWidget {
  const CustomSocialButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LoginGoogle(
          image: Assets.imagesGoogle,
          title: AppStrings.loginwithgoogle,
          onPressed: () {
            context.read<SigninCubit>().signInWithGoogle();
          },
        ),
        SizedBox(height: 16),
        LoginApple(
          image: Assets.imagesApple,
          title: AppStrings.loginwithapple,
          onPressed: () {},
        ),
        SizedBox(height: 16),
        LoginFaceBook(
          image: Assets.imagesFacebook,
          title: AppStrings.loginwithfacebook,
          onPressed: () {
            context.read<SigninCubit>().signInWithFacebook();
          },
        ),

      ],
    );
  }
}
