import 'package:elections/core/theming/styles.dart';
import 'package:elections/core/widgets/app_snack_bar.dart';
import 'package:elections/core/widgets/app_text_button.dart';
import 'package:elections/features/candidate_login/logic/cubit/candidate_login_cubit.dart';
import 'package:elections/features/voter_login/logic/cubit/voter_login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VoterLoginButton extends StatelessWidget {
  const VoterLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextButton(
      onPressed: () => actionTapButtonLogin(context),
      text: 'Login',
      textStyle: TextStyles.font28WhiteSemiBold,
    );
  }

  void actionTapButtonLogin(BuildContext context) {
    final cubit = context.read<VoterLoginCubit>();
    if (cubit.formKey.currentState!.validate()) {
      cubit.emitVoterLoginRequest();
    }
  }

  void messageErrorChooseImage(BuildContext context, String message) {
    appSnackBar(
      text: message,
      backGroundColor: Colors.red,
      context: context,
    );
  }
}
