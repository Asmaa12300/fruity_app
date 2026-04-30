import 'package:flutter/material.dart';
import 'package:fruity_app/features/auth/presentatin/widgets/signup_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/functions/build_error_bar.dart';
import '../../../../core/functions/build_success_bar.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../cubits/signup_cubits/signup_cubit.dart';

class SignupBodyBlocConsumer extends StatelessWidget {
  const SignupBodyBlocConsumer({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          Navigator.pop(context);
          buildSuccessBar(context);
        } if (state is SignupFailure) {
          buildErrorBar(context, state.message);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignupLoading ? true : false,
            child: SignupBody()
        );
      },
    );
  }
}