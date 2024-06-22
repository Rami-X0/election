import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "candidate_sign_up_state.freezed.dart";

@freezed
class CandiDateSignUpState with _$CandiDateSignUpState {
  const factory CandiDateSignUpState.initial() = _Initial;

  const factory CandiDateSignUpState.loading() = Loading;

  const factory CandiDateSignUpState.signUpSuccess() = SignUpSuccess;

  const factory CandiDateSignUpState.signUpFailure(
      {required DioException apiError}) = SignUpFailure;
}
