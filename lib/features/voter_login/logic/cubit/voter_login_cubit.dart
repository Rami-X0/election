import 'package:elections/features/voter_login/data/models/voter_login_request.dart';
import 'package:elections/features/voter_login/data/repo/voter_login_repo.dart';
import 'package:elections/features/voter_login/logic/cubit/voter_login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VoterLoginCubit extends Cubit<VoterLoginState> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final VoterLoginRepo _candiDateLoginRepo;

  VoterLoginCubit(this._candiDateLoginRepo)
      : super(const VoterLoginState.initial());

  void emitVoterLoginRequest() async {
    emit(const VoterLoginState.loading());
    final response = await _candiDateLoginRepo.candiDateLogin(
        request: VoterLoginRequest(
            email: emailController.text, password: passwordController.text));
    response.when(success: (data) async {
      emit(
        VoterLoginState.loginSuccess(response: data),
      );
    }, failure: (failure) {
      emit(VoterLoginState.loginFailure(apiError: failure));
    });
  }
}
