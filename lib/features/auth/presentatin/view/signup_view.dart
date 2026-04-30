import 'package:flutter/material.dart';
import 'package:fruity_app/core/utils/App_colours.dart';
import 'package:fruity_app/core/utils/app_strings.dart';
import '../../../../core/services/get_it.dart';
import '../../../../core/widget/custom_appbar.dart';
import '../../domain/repos/repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/signup_cubits/signup_cubit.dart';
import '../widgets/signup_body_bloc_comsumer.dart';


class SignupView extends StatelessWidget {
  const SignupView({super.key});

  static const routeName = 'SignupView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt<AuthRepository>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: AppStrings.newaccount),
        backgroundColor: AppColors.white,
        body: SignupBodyBlocConsumer(),
      ),
    );
  }
}
