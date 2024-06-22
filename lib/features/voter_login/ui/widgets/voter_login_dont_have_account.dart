import 'package:elections/core/helper/extension.dart';
import 'package:elections/core/routing/routes.dart';
import 'package:elections/core/theming/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VoterLoginDontHaveAccount extends StatelessWidget {
  const VoterLoginDontHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: 'don\`t have an account? ',
        style: TextStyles.font15DarkBlueMedium.copyWith(),
        children: [
          TextSpan(
            text: 'Sign Up',
            style: TextStyles.font15DarkBlueMedium.copyWith(
              fontSize: 17.sp,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () =>
                  context.pushNamedAndRemoveUntil(Routes.voterSignUpScreen),
          ),
        ],
      ),
    );
  }
}
