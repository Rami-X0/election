import 'package:dio/dio.dart';
import 'package:elections/features/candidate_login/data/models/candidate_login_response.dart';
import 'package:elections/features/voter_login/data/models/voter_login_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "voter_login_state.freezed.dart";

@freezed
class VoterLoginState with _$VoterLoginState {
  const factory VoterLoginState.initial() = _Initial;

  const factory VoterLoginState.loading() = Loading;

  const factory VoterLoginState.loginSuccess({
    required VoterLoginResponse response,
  }) = LoginSuccess;

  const factory VoterLoginState.loginFailure(
      {required DioException apiError}) = LoginFailure;
}
