import 'dart:io';

import 'package:elections/features/voter_sign_up/data/models/voter_sign_up_request.dart';
import 'package:elections/features/voter_sign_up/data/repo/voter_sign_up_repo.dart';
import 'package:elections/features/voter_sign_up/logic/cubit/voter_sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class VoterSignUpCubit extends Cubit<VoterSignUpState> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  XFile? nationalIdImage;
  XFile? image;
  final VoterSignUpRepo _candiDateSignUpRepo;

  VoterSignUpCubit(this._candiDateSignUpRepo)
      : super(const VoterSignUpState.initial());

  Future<VoterSignUpRequest> candiDateSignUpData() async {
    return VoterSignUpRequest(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      nationalIdImage: nationalIdImage!.path,
    );
  }

  void emitVoterSignUpRequest() async {
    emit(const VoterSignUpState.loading());
    final request = await candiDateSignUpData();
    final response = await _candiDateSignUpRepo.voterSignUp(
      request: request,
      nationalIdImage: File(nationalIdImage!.path),
    );
    response.when(success: (data) async {
      emit(const VoterSignUpState.signUpSuccess());
    }, failure: (failure) {
      emit(VoterSignUpState.signUpFailure(apiError: failure));
    });
  }
}
