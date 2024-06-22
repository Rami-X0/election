import 'package:dio/dio.dart';
import 'package:elections/core/networking/api_constants.dart';
import 'package:elections/features/candidate_login/data/models/candidate_login_request.dart';
import 'package:elections/features/candidate_login/data/models/candidate_login_response.dart';
import 'package:elections/features/voter_home/data/models/all_candate_response.dart';
import 'package:elections/features/voter_home/data/models/issue_based_response.dart';
import 'package:elections/features/voter_home/data/models/political_parties_response.dart';
import 'package:elections/features/voter_login/data/models/voter_login_request.dart';
import 'package:elections/features/voter_login/data/models/voter_login_response.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;

  @POST(ApiConstants.candiDateSignUpUrl)
  Future candiDateSignUp(@Body() FormData request);

  @POST(ApiConstants.candiDateLoginUrl)
  Future<CandiDateLoginResponse> candiDateLogin(
      @Body() CandiDateLoginRequest request);

  @POST(ApiConstants.voterSignUpUrl)
  Future voterSignUp(@Body() FormData request);

  @POST(ApiConstants.voterLoginUrl)
  Future<VoterLoginResponse> voterLogin(@Body() VoterLoginRequest request);

  @GET(ApiConstants.politicalPartiesUrl)
  Future<List<CategoriesResponse>> politicalParties();

  @GET(ApiConstants.politicalIssueUrl)
  Future<List<IssueBasedResponse>> issueBased();

  @GET(ApiConstants.allCandidatesUrl)
  Future<List<AllCandidateResponse>> allCandidate();
}
