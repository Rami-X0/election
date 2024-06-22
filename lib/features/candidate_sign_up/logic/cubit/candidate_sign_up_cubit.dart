import 'dart:io';

import 'package:elections/features/candidate_sign_up/data/models/candidate_sign_up_request.dart';
import 'package:elections/features/candidate_sign_up/data/repo/candidate_sign_up_repo.dart';
import 'package:elections/features/candidate_sign_up/logic/cubit/candidate_sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class CandiDateSignUpCubit extends Cubit<CandiDateSignUpState> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  XFile? personalImage;
  XFile? nationalIdImage;
  String gender = "Male";
  final CandiDateSignUpRepo _candiDateSignUpRepo;

  CandiDateSignUpCubit(this._candiDateSignUpRepo)
      : super(const CandiDateSignUpState.initial());

  Future<CandiDateSignUpRequest> candiDateSignUpData() async {
    return CandiDateSignUpRequest(
      name: nameController.text,
      email: emailController.text,
      gender: gender,
      password: passwordController.text,
      personalImage: personalImage!.path,
      nationalIdImage: nationalIdImage!.path,
    );
  }

  void emitCandiDateSignUpRequest() async {
    emit(const CandiDateSignUpState.loading());
    final request = await candiDateSignUpData();
    final response = await _candiDateSignUpRepo.candiDateSignUp(
      request: request,
      personalImage: File(personalImage!.path),
      nationalIdImage: File(nationalIdImage!.path),
    );
    response.when(success: (data) async {
      emit(const CandiDateSignUpState.signUpSuccess());
    }, failure: (failure) {
      emit(CandiDateSignUpState.signUpFailure(apiError: failure));
    });
  }
}
