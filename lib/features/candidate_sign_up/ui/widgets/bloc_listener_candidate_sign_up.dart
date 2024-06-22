import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:elections/core/helper/extension.dart';
import 'package:elections/core/routing/routes.dart';
import 'package:elections/core/widgets/app_blur_dialog.dart';
import 'package:elections/core/widgets/app_loading.dart';
import 'package:elections/features/candidate_sign_up/logic/cubit/candidate_sign_up_cubit.dart';
import 'package:elections/features/candidate_sign_up/logic/cubit/candidate_sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocListenerCandiDateSignUp extends StatelessWidget {
  const BlocListenerCandiDateSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CandiDateSignUpCubit, CandiDateSignUpState>(
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return const AppBlurDialog(
                  child: AppLoading(),
                );
              },
            );
          },
          signUpSuccess: () {
            context.pushNamedAndRemoveUntil(Routes.candidateLoginScreen);
            context.pop();
          },
          signUpFailure: (failure) {
            context.pop();
            setupErrorState(context, failure);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}

void setupErrorState(BuildContext context, DioException failure) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          failure.message.toString(),
          style: const TextStyle(
              color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'Got it',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    ),
  );
}
