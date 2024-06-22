import 'package:elections/core/theming/colors.dart';
import 'package:elections/core/theming/styles.dart';
import 'package:elections/features/voter_home/data/models/issue_based_response.dart';
import 'package:elections/features/voter_home/data/models/political_parties_response.dart';
import 'package:elections/features/voter_home/logic/cubit/voter_home_cubit.dart';
import 'package:elections/features/voter_home/logic/cubit/voter_home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseCategoryIssueBased extends StatefulWidget {
  const ChooseCategoryIssueBased({super.key});

  @override
  State<ChooseCategoryIssueBased> createState() =>
      ChooseCategoryPoliticalPartiesState();
}

class ChooseCategoryPoliticalPartiesState
    extends State<ChooseCategoryIssueBased> {
  String? _selectedService;

  void _onChanged(String? newValue, List<IssueBasedResponse> servicesId) {
    setState(
      () {
        _selectedService = newValue;
        final selectedService = servicesId
            .firstWhere((service) => service.id.toString() == newValue);
        context.read<VoterHomeCubit>().politicalParties = selectedService.id;
      },
    );

    debugPrint(
        'idddddddddddddddddddddddddd=>${context.read<VoterHomeCubit>().politicalParties}');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220.w,
      height: 80.h,
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      decoration: BoxDecoration(
        color: ColorsManager.mainColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black),
      ),
      child: BlocBuilder<VoterHomeCubit, VoterHomeState>(
        buildWhen: (previous, current) =>
            current is IssueBaseLoading ||
            current is IssueBaseFailure ||
            current is IssueBaseLoaded,
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
              return const SizedBox.shrink();
            },
            issueBaseLoading: () {
              return loadingGetServices();
            },
            issueBaseFailure: (failure) {
              return const SizedBox.shrink();
            },
            issueBaseLoaded: (servicesId) {
              return dropDownButtonList(servicesId);
            },
          );
        },
      ),
    );
  }

  Widget loadingGetServices() {
    return Center(
      child: Text(
        'waiting',
        style: TextStyles.font15DarkBlueMedium,
      ),
    );
  }

  Widget dropDownButtonList(List<IssueBasedResponse> servicesId) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: DropdownButton<String>(
        borderRadius: BorderRadius.circular(10),
        underline: Container(),
        hint: const Text('Sub-Category'),
        dropdownColor: ColorsManager.mainColor,
        value: _selectedService,
        items: servicesId.map((IssueBasedResponse value) {
          return DropdownMenuItem<String>(
            value: value.id.toString(),
            child: Text(
              value.name,
              style: TextStyles.font15DarkBlueMedium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          );
        }).toList(),
        style: TextStyles.font15DarkBlueMedium,
        onChanged: (newValue) => _onChanged(newValue, servicesId),
      ),
    );
  }
}
