import 'package:elections/core/theming/styles.dart';
import 'package:elections/core/widgets/app_snack_bar.dart';
import 'package:elections/core/widgets/app_text_button.dart';
import 'package:elections/features/candidate_sign_up/logic/cubit/candidate_sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CandiDateSignUpButton extends StatelessWidget {
  const CandiDateSignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextButton(
      onPressed: () => actionTapButtonLogin(context),
      text: 'Sign Up',
      textStyle: TextStyles.font28WhiteSemiBold,
    );
  }

  void actionTapButtonLogin(BuildContext context) {
    final cubit = context.read<CandiDateSignUpCubit>();
    if (cubit.formKey.currentState!.validate()) {
      if (cubit.personalImage == null) {
        messageErrorChooseImage(context,'Please choose personal image');
      } else if(cubit.nationalIdImage == null){
        messageErrorChooseImage(context,'Please choose id image');
      }else{
        cubit.emitCandiDateSignUpRequest();

      }
    }
  }

  void messageErrorChooseImage(BuildContext context,String message) {
    appSnackBar(
      text: message,
      backGroundColor: Colors.red,
      context: context,
    );
  }
}
