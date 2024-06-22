import 'dart:io';

import 'package:elections/core/theming/colors.dart';
import 'package:elections/core/theming/styles.dart';
import 'package:elections/features/candidate_sign_up/logic/cubit/candidate_sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

class ChoosePersonalImageCandiDateSignUp extends StatefulWidget {
  const ChoosePersonalImageCandiDateSignUp({super.key});

  @override
  State<ChoosePersonalImageCandiDateSignUp> createState() =>
      _ChoosePersonalImageCandiDateSignUpState();
}

class _ChoosePersonalImageCandiDateSignUpState extends State<ChoosePersonalImageCandiDateSignUp> {
  final ImagePicker _imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => actionThenTapButton(),
          child: Container(
            width: 130.w,
            height: 35.h,
            decoration: BoxDecoration(
              color: ColorsManager.lightGray,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: ColorsManager.darkBlue,
                width: 1,
              ),
            ),
            child: Center(
              child: Text(
                'personal image',
                style: TextStyles.font15DarkBlueMedium,
              ),
            ),
          ),
        ),
        Gap(5.w),
        if (context.read<CandiDateSignUpCubit>().personalImage != null)
          Row(
            children: [
              Image.file(
                File(context.read<CandiDateSignUpCubit>().personalImage!.path),
                width: 30.w,
                height: 30.h,
                fit: BoxFit.cover,
              ),
              Gap(10.w),
              GestureDetector(
                onTap: () {
                  setState(() {
                    context.read<CandiDateSignUpCubit>().personalImage = null;
                  });
                },
                child: FaIcon(
                  FontAwesomeIcons.x,
                  color: Colors.black,
                  size: 18.w,
                ),
              )
            ],
          ),
        Gap(10.w),
      ],
    );
  }

  Future<void> actionThenTapButton() async {
    try {
      XFile? pickedImage = await _imagePicker.pickImage(
        source: ImageSource.gallery,
      );
      if (pickedImage != null) {
        setState(() {
          context.read<CandiDateSignUpCubit>().personalImage = pickedImage;
        });
      } else {
        setState(() {
          context.read<CandiDateSignUpCubit>().personalImage = pickedImage;
        });
      }
    } catch (failure) {
      debugPrint('failure choose image picker=>${failure.toString()}');
    }
  }
}
