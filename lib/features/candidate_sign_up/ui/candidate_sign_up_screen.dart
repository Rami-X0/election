
import 'package:elections/core/theming/styles.dart';
import 'package:elections/core/widgets/scale_fade_align.dart';
import 'package:elections/features/candidate_sign_up/logic/cubit/candidate_sign_up_cubit.dart';
import 'package:elections/features/candidate_sign_up/ui/widgets/bloc_listener_candidate_sign_up.dart';
import 'package:elections/features/candidate_sign_up/ui/widgets/candidate_sign_up_button.dart';
import 'package:elections/features/candidate_sign_up/ui/widgets/candidate_sign_up_form.dart';
import 'package:elections/features/candidate_sign_up/ui/widgets/candidate_sign_up_gender.dart';
import 'package:elections/features/candidate_sign_up/ui/widgets/candidate_sign_up_have_account.dart';
import 'package:elections/features/candidate_sign_up/ui/widgets/choose_nationalId_image_candidate_sign_up.dart';
import 'package:elections/features/candidate_sign_up/ui/widgets/choose_personal_image_candidate_sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CandiDateSignUpScreen extends StatelessWidget {
  const CandiDateSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AppScaleFadeAlign(
                    begin: Alignment.topCenter,
                    end: Alignment.center,
                    child: Text(
                      'Candidate Create Account',
                      style: TextStyles.font30MainColorBold,
                    ),
                  ),
                  AppScaleFadeAlign(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Gap(18.h),
                        const CandiDateSignUpForm(),
                        Gap(25.h),
                        const ChoosePersonalImageCandiDateSignUp(),
                        Gap(20.h),
                        const ChooseNationalIdImageCandiDateSignUp(),
                        Gap(20.h),
                        const CandiDateSignUpGender(),
                        Gap(25.h),
                        const CandiDateSignUpButton(),
                        Gap(25.h),
                        const CandiDateSignUpHaveAccount(),
                        const BlocListenerCandiDateSignUp(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
