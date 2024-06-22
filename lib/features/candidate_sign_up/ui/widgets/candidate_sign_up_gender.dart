import 'package:elections/core/theming/colors.dart';
import 'package:elections/core/theming/styles.dart';
import 'package:elections/features/candidate_sign_up/logic/cubit/candidate_sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CandiDateSignUpGender extends StatefulWidget {
  const CandiDateSignUpGender({super.key});

  @override
  State<CandiDateSignUpGender> createState() => _CandiDateSignUpGenderState();
}

String genderMale = 'Male';
String genderFemale = 'Female';
String groupValue = 'Male';

class _CandiDateSignUpGenderState extends State<CandiDateSignUpGender> {
  @override
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: _defaultRadio(
              title: genderMale,
              value: genderMale,
              groupValue: groupValue,
              onChanged: (value) {
                setState(() {
                  groupValue = value;
                  context.read<CandiDateSignUpCubit>().gender=value;

                });
              }),
        ),
        Expanded(
          child: _defaultRadio(
              title: genderFemale,
              value: genderFemale,
              groupValue: groupValue,
              onChanged: (value) {
                setState(() {
                  groupValue = value;
                  context.read<CandiDateSignUpCubit>().gender=value;
                });
              }),
        ),
      ],
    );
  }

  Widget _defaultRadio({
    required String title,
    required dynamic value,
    required dynamic groupValue,
    required void Function(dynamic)? onChanged,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: ListTile(
        hoverColor: Colors.transparent,
        selectedTileColor: Colors.transparent,
        contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
        dense: true,

        title: Text(
          title,
          style: TextStyles.font15DarkBlueMedium,
        ),
    
        leading: Radio(
          fillColor: WidgetStateProperty.all(ColorsManager.mainColor),
          overlayColor: WidgetStateProperty.all(ColorsManager.lightGray),
          value: value,
          onChanged: onChanged,
          groupValue: groupValue,
        ),
      ),
    );
  }
}
