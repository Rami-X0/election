import 'package:dio/dio.dart';
import 'package:elections/features/voter_home/data/models/all_candate_response.dart';
import 'package:elections/features/voter_home/data/models/issue_based_response.dart';
import 'package:elections/features/voter_home/data/models/political_parties_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "voter_home_state.freezed.dart";

@freezed
class VoterHomeState with _$VoterHomeState {
  const factory VoterHomeState.initial() = _Initial;

  const factory VoterHomeState.politicalPartiesLoading() =
      PoliticalPartiesLoading;

  const factory VoterHomeState.politicalPartiesLoaded(
    List<CategoriesResponse> politicalParties,
  ) = PoliticalPartiesLoaded;

  const factory VoterHomeState.politicalPartiesError(
    DioException message,
  ) = PoliticalPartiesError;

  const factory VoterHomeState.issueBaseLoading() = IssueBaseLoading;

  const factory VoterHomeState.issueBaseLoaded(
    List<IssueBasedResponse> politicalParties,
  ) = IssueBaseLoaded;

  const factory VoterHomeState.issueBaseFailure(
    DioException message,
  ) = IssueBaseFailure;

  const factory VoterHomeState.allCandidateLoading() = AllCandidateLoading;

  const factory VoterHomeState.allCandidateLoaded(
    List<AllCandidateResponse> politicalParties,
  ) = AllCandidateLoaded;

  const factory VoterHomeState.allCandidateFailure(
    DioException message,
  ) = AllCandidateFailure;
}
