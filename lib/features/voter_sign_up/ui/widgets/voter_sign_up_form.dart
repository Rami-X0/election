import 'package:elections/core/theming/colors.dart';
import 'package:elections/core/widgets/app_text_form_field.dart';
import 'package:elections/features/candidate_sign_up/logic/cubit/candidate_sign_up_cubit.dart';
import 'package:elections/features/voter_sign_up/logic/cubit/voter_sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class VoterSignUpForm extends StatefulWidget {
  const VoterSignUpForm({super.key});

  @override
  State<VoterSignUpForm> createState() => _VoterSignUpFormState();
}

class _VoterSignUpFormState extends State<VoterSignUpForm> {
  bool _showPassword = true;
  bool isNameColorFailureIcon = false;
  bool isEmailColorFailureIcon = false;
  bool isPasswordColorFailureIcon = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<VoterSignUpCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: context.read<VoterSignUpCubit>().nameController,
            hintText: 'name',
            suffixIcon: FaIcon(
              FontAwesomeIcons.user,
              color: isNameColorFailureIcon
                  ? Colors.red
                  : ColorsManager.mainColor,
            ),
            validator: (value) {
              return validateFirstName(value);
            },
          ),

          Gap(16.h),
          AppTextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: context.read<VoterSignUpCubit>().emailController,
            hintText: 'email',
            suffixIcon: FaIcon(
              FontAwesomeIcons.envelope,
              color: isEmailColorFailureIcon
                  ? Colors.red
                  : ColorsManager.mainColor,
            ),
            validator: (value) {
              return validateEmail(value);
            },
          ),
          Gap(16.h),
          AppTextFormField(
            keyboardType: TextInputType.visiblePassword,
            controller: context.read<VoterSignUpCubit>().passwordController,
            hintText: 'password',
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _showPassword = !_showPassword;
                });
              },
              child: FaIcon(
                _showPassword
                    ? FontAwesomeIcons.eyeSlash
                    : FontAwesomeIcons.eye,
                color: isPasswordColorFailureIcon
                    ? Colors.red
                    : ColorsManager.mainColor,
              ),
            ),
            obscureText: _showPassword,
            validator: (value) {
              return validatePassword(value);
            },
          ),

        ],
      ),
    );
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      setState(() {
        isEmailColorFailureIcon = true;
      });
      return 'Please enter your user email';
    } else {
      setState(() {
        isEmailColorFailureIcon = false;
      });
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      setState(() {
        isPasswordColorFailureIcon = true;
      });
      return 'Please enter your password';
    } else if (value.length < 8) {
      setState(() {
        isPasswordColorFailureIcon = true;
      });
      return 'Password must be at least 8 characters';
    } else {
      setState(() {
        isPasswordColorFailureIcon = false;
      });
    }
    return null;
  }

  String? validateFirstName(String? value) {
    if (value == null || value.isEmpty) {
      setState(() {
        isPasswordColorFailureIcon = true;
      });
      return 'Please enter your first name';
    } else {
      setState(() {
        isPasswordColorFailureIcon = false;
      });
    }
    return null;
  }




}
