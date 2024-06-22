import 'package:dio/dio.dart';
import 'package:elections/core/networking/api_result.dart';
import 'package:elections/core/networking/api_services.dart';
import 'package:elections/features/candidate_login/data/models/candidate_login_request.dart';
import 'package:elections/features/candidate_login/data/models/candidate_login_response.dart';

class CandiDateLoginRepo {
  final ApiServices _apiServices;

  CandiDateLoginRepo(this._apiServices);

  Future<ApiResult<CandiDateLoginResponse>> candiDateLogin({
    required CandiDateLoginRequest request,
  }) async {
    try {
      final response = await _apiServices.candiDateLogin(request);
      return ApiResult.success(response);
    } on DioException catch (failure) {
      return ApiResult.failure(failure);
    }
  }
}
