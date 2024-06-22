import 'package:elections/features/candidate_login/data/models/candidate_login_request.dart';
import 'package:elections/features/candidate_login/data/repo/candidate_login_repo.dart';
import 'package:elections/features/candidate_login/logic/cubit/candidate_login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CandiDateLoginCubit extends Cubit<CandiDateLoginState> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final CandiDateLoginRepo _candiDateLoginRepo;

  CandiDateLoginCubit(this._candiDateLoginRepo)
      : super(const CandiDateLoginState.initial());

  void emitCandiDateLoginRequest() async {
    emit(const CandiDateLoginState.loading());
    final response = await _candiDateLoginRepo.candiDateLogin(
        request: CandiDateLoginRequest(
            email: emailController.text, password: passwordController.text));
    response.when(success: (data) async {
      emit(
        CandiDateLoginState.loginSuccess(response: data),
      );
    }, failure: (failure) {
      emit(CandiDateLoginState.loginFailure(apiError: failure));
    });
  }
}
