import 'package:elections/core/helper/extension.dart';
import 'package:elections/core/routing/routes.dart';
import 'package:elections/core/theming/colors.dart';
import 'package:elections/core/theming/styles.dart';
import 'package:elections/core/widgets/app_text_button.dart';
import 'package:elections/core/widgets/scale_fade_align.dart';
import 'package:elections/features/voter_home/logic/cubit/voter_home_cubit.dart';
import 'package:elections/features/voter_home/ui/widget/choose_category_issue_based.dart';
import 'package:elections/features/voter_home/ui/widget/choose_category_political_parties.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ChooseCategoryVoterScreen extends StatelessWidget {
  const ChooseCategoryVoterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<VoterHomeCubit>().emitVoterPoliticalParties();
    context.read<VoterHomeCubit>().emitIssueBased();
    return Scaffold(
      body: Column(
        children: [
          Gap(130.h),
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
          Gap(40.h),
          const ChooseCategoryPoliticalParties(),
          Gap(40.h),
          const ChooseCategoryIssueBased(),
          Gap(40.h),
          AppTextButton(
            border: 5,
            horizontalSize: 210,
            onPressed: () {
              context.pushNamedAndRemoveUntil(Routes.voterLoginScreen);
            },
            text: 'Done',
            textStyle: TextStyles.font15DarkBlueMedium
                .copyWith(color: ColorsManager.darkBlue, fontSize: 20.sp),
          )
        ],
      ),
    );
  }
}
