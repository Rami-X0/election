import 'package:elections/core/helper/extension.dart';
import 'package:elections/core/routing/routes.dart';
import 'package:elections/core/theming/colors.dart';
import 'package:elections/core/theming/styles.dart';
import 'package:elections/core/widgets/app_text_button.dart';
import 'package:elections/core/widgets/scale_fade_align.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ChooseAccountUser extends StatelessWidget {
  const ChooseAccountUser({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        SystemNavigator.pop();
      },
      child: Scaffold(
        body: SafeArea(
          child: Container(
            color: Colors.white,
            height: double.maxFinite,
            child: Stack(
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
                  end: const Alignment(0.0, 0.4),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppTextButton(
                        onPressed: () {
                          context.pushNamed(Routes.candidateSignUpScreen);
                        },
                        text: 'Candidate',
                        textStyle: TextStyles.font28WhiteSemiBold,
                      ),
                      Gap(35.h),
                      AppTextButton(
                        onPressed: () {
                          context.pushNamed(Routes.voterSignUpScreen);
                        },
                        text: 'Voter',
                        textStyle: TextStyles.font28WhiteSemiBold,
                      ),
                      Gap(35.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
