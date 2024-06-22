import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "voter_sign_up_state.freezed.dart";

@freezed
class VoterSignUpState with _$VoterSignUpState {
  const factory VoterSignUpState.initial() = _Initial;

  const factory VoterSignUpState.loading() = Loading;

  const factory VoterSignUpState.signUpSuccess() = SignUpSuccess;

  const factory VoterSignUpState.signUpFailure(
      {required DioException apiError}) = SignUpFailure;
}
