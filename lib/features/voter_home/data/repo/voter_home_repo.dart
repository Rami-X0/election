import 'package:dio/dio.dart';
import 'package:elections/core/networking/api_result.dart';
import 'package:elections/core/networking/api_services.dart';
import 'package:elections/features/voter_home/data/models/all_candate_response.dart';
import 'package:elections/features/voter_home/data/models/issue_based_response.dart';
import 'package:elections/features/voter_home/data/models/political_parties_response.dart';

class VoterHomeRepo {
  final ApiServices _apiServices;

  VoterHomeRepo(this._apiServices);

  Future<ApiResult<List<CategoriesResponse>>> politicalParties() async {
    try {
      final response = await _apiServices.politicalParties();
      return ApiResult.success(response);
    } on DioException catch (failure) {
      return ApiResult.failure(failure);
    }
  }

  Future<ApiResult<List<IssueBasedResponse>>> issueBased() async {
    try {
      final response = await _apiServices.issueBased();
      return ApiResult.success(response);
    } on DioException catch (failure) {
      return ApiResult.failure(failure);
    }
  }

  Future<ApiResult<List<AllCandidateResponse>>> allCandidate() async {
    try {
      final response = await _apiServices.allCandidate();
      return ApiResult.success(response);
    } on DioException catch (failure) {
      return ApiResult.failure(failure);
    }
  }
}
