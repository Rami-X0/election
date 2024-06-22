import 'package:elections/core/theming/styles.dart';
import 'package:elections/features/voter_home/logic/cubit/voter_home_cubit.dart';
import 'package:elections/features/voter_home/ui/widget/bloc_builder_all_candidate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VoterHomeScreen extends StatelessWidget {
  const VoterHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<VoterHomeCubit>().emitAllCandidate();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyles.font15DarkBlueMedium.copyWith(fontSize: 20.sp),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: const BlocBuilderAllCandidate(),
    );
  }
}
