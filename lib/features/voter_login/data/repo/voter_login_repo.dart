import 'package:dio/dio.dart';
import 'package:elections/core/networking/api_result.dart';
import 'package:elections/core/networking/api_services.dart';
import 'package:elections/features/candidate_login/data/models/candidate_login_request.dart';
import 'package:elections/features/candidate_login/data/models/candidate_login_response.dart';
import 'package:elections/features/voter_login/data/models/voter_login_request.dart';
import 'package:elections/features/voter_login/data/models/voter_login_response.dart';

class VoterLoginRepo {
  final ApiServices _apiServices;

  VoterLoginRepo(this._apiServices);

  Future<ApiResult<VoterLoginResponse>> candiDateLogin({
    required VoterLoginRequest request,
  }) async {
    try {
      final response = await _apiServices.voterLogin(request);
      return ApiResult.success(response);
    } on DioException catch (failure) {
      return ApiResult.failure(failure);
    }
  }
}
