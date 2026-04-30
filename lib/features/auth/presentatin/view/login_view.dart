import 'package:flutter/material.dart';
import 'package:fruity_app/core/services/get_it.dart';
import 'package:fruity_app/core/utils/App_colours.dart';
import 'package:fruity_app/core/utils/app_strings.dart';
import 'package:fruity_app/features/auth/domain/repos/repo.dart';
import 'package:fruity_app/features/auth/presentatin/cubits/signin_cubit/signin_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widget/custom_appbar.dart';
import '../widgets/login_body_bloc_consumer.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const routeName = 'loginView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(getIt.get<AuthRepository>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: AppStrings.signin),
        backgroundColor: AppColors.white,
        body: LoginBodyBlocConsumer(),
      ),
    );
  }
}

