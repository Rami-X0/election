import 'package:elections/core/theming/styles.dart';
import 'package:elections/core/widgets/scale_fade_align.dart';
import 'package:elections/features/voter_sign_up/ui/widgets/bloc_listener_voter_sign_up.dart';
import 'package:elections/features/voter_sign_up/ui/widgets/choose_nationalId_image_voter_sign_up.dart';
import 'package:elections/features/voter_sign_up/ui/widgets/voter_sign_up_button.dart';
import 'package:elections/features/voter_sign_up/ui/widgets/voter_sign_up_form.dart';
import 'package:elections/features/voter_sign_up/ui/widgets/voter_sign_up_have_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class VoterSignUpScreen extends StatelessWidget {
  const VoterSignUpScreen({super.key});

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
                      'Voter Create Account',
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
                        const VoterSignUpForm(),
                        Gap(25.h),
                        const ChooseNationalIdImageVoterSignUp(),
                        Gap(25.h),
                        const VoterSignUpButton(),
                        Gap(25.h),
                        const VoterSignUpHaveAccount(),
                        const BlocListenerVoterSignUp(),
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
