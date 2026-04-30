import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/functions/build_error_bar.dart';
import '../../../../core/functions/build_success_bar.dart';
import '../../../../core/widget/custom_progress_hud.dart';
import '../../../home/presentation/view/main_view.dart';
import '../cubits/signin_cubit/signin_cubit.dart';
import 'login_body.dart';

class LoginBodyBlocConsumer extends StatelessWidget {
  const LoginBodyBlocConsumer({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccess) {
          Navigator.pushNamed(context,MainView.routeName);
          buildSuccessBar(context);
        }
        if (state is SigninFailure) {
            buildErrorBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
            isLoading: state is SigninLoading? true:false,
            child: LoginBody());
      },
    );
  }
}

