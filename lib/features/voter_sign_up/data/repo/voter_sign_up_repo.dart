import 'dart:io';

import 'package:dio/dio.dart';
import 'package:elections/core/networking/api_result.dart';
import 'package:elections/core/networking/api_services.dart';
import 'package:elections/features/voter_sign_up/data/models/voter_sign_up_request.dart';

class VoterSignUpRepo {
  final ApiServices _apiServices;

  VoterSignUpRepo(this._apiServices);

  Future<ApiResult> voterSignUp({
    required VoterSignUpRequest request,
    required File nationalIdImage,
  }) async {
    final formData = await _createFormData(request, nationalIdImage);

    try {
      final response = await _apiServices.voterSignUp(formData);
      return ApiResult.success(response);
    } on DioException catch (failure) {
      return ApiResult.failure(failure);
    }
  }

  Future<FormData> _createFormData(
      VoterSignUpRequest trainerSignUpRequest, File nationalIdImage) async {
    return FormData.fromMap({
      "Name": trainerSignUpRequest.name,
      "Email": trainerSignUpRequest.email,
      "Password": trainerSignUpRequest.password,
      "NationalIdImage": await MultipartFile.fromFile(nationalIdImage.path,
          filename: nationalIdImage.path.split('/').last),
    });
  }
}
