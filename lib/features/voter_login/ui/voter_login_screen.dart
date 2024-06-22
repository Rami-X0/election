import 'package:elections/core/theming/colors.dart';
import 'package:elections/core/widgets/scale_fade_align.dart';
import 'package:elections/features/candidate_login/ui/widgets/bloc_listener_candidate_login.dart';
import 'package:elections/features/candidate_login/ui/widgets/candidate_login_dont_have_account.dart';
import 'package:elections/features/candidate_login/ui/widgets/candidate_login_button.dart';
import 'package:elections/features/candidate_login/ui/widgets/candidate_login_form.dart';
import 'package:elections/features/voter_login/ui/widgets/bloc_listener_voter_login.dart';
import 'package:elections/features/voter_login/ui/widgets/voter_login_button.dart';
import 'package:elections/features/voter_login/ui/widgets/voter_login_dont_have_account.dart';
import 'package:elections/features/voter_login/ui/widgets/voter_login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class VoterLoginScreen extends StatelessWidget {
  const VoterLoginScreen({super.key});

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
                    end: const Alignment(0.0, -0.6),
                    child: Container(
                      width: 160.w,
                      height: 170.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: ColorsManager.white,
                          width: 3.w,
                        ),
                        color: Colors.white,
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          image: AssetImage('assets/images/election_app_logo.jpg'),
                        ),
                      ),
                    ),
                  ),
                  AppScaleFadeAlign(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Gap(18.h),
                        const VoterLoginForm(),
                        Gap(25.h),
                        const VoterLoginButton(),
                        Gap(25.h),
                        const VoterLoginDontHaveAccount(),
                        const BlocListenerVoterLogin(),
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
