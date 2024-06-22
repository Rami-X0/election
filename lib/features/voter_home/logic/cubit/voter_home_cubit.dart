import 'package:elections/features/voter_home/data/repo/voter_home_repo.dart';
import 'package:elections/features/voter_home/logic/cubit/voter_home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VoterHomeCubit extends Cubit<VoterHomeState> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  int? politicalParties;
  int? issueBased;
  final VoterHomeRepo _candiDateLoginRepo;

  VoterHomeCubit(this._candiDateLoginRepo)
      : super(const VoterHomeState.initial());

  void emitVoterPoliticalParties() async {
    emit(const VoterHomeState.politicalPartiesLoading());
    final response = await _candiDateLoginRepo.politicalParties();

    response.when(success: (data) async {
      emit(
        VoterHomeState.politicalPartiesLoaded(data),
      );
    }, failure: (failure) {
      emit(VoterHomeState.politicalPartiesError(failure));
    });
  }

  void emitIssueBased() async {
    emit(const VoterHomeState.issueBaseLoading());
    final response = await _candiDateLoginRepo.issueBased();

    response.when(success: (data) async {
      emit(
        VoterHomeState.issueBaseLoaded(data),
      );
    }, failure: (failure) {
      emit(VoterHomeState.issueBaseFailure(failure));
    });
  }

  void emitAllCandidate() async {
    emit(const VoterHomeState.allCandidateLoading());
    final response = await _candiDateLoginRepo.allCandidate();

    response.when(success: (data) async {
      emit(
        VoterHomeState.allCandidateLoaded(data),
      );
    }, failure: (failure) {
      emit(VoterHomeState.allCandidateFailure(failure));
    });
  }
}
