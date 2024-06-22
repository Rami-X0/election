import 'package:dio/dio.dart';
import 'package:elections/features/candidate_login/data/models/candidate_login_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "candidate_login_state.freezed.dart";

@freezed
class CandiDateLoginState with _$CandiDateLoginState {
  const factory CandiDateLoginState.initial() = _Initial;

  const factory CandiDateLoginState.loading() = Loading;

  const factory CandiDateLoginState.loginSuccess({
    required CandiDateLoginResponse response,
  }) = LoginSuccess;

  const factory CandiDateLoginState.loginFailure(
      {required DioException apiError}) = LoginFailure;
}
