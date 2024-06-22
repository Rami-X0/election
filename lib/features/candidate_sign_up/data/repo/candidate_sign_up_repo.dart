import 'dart:io';

import 'package:dio/dio.dart';
import 'package:elections/core/networking/api_result.dart';
import 'package:elections/core/networking/api_services.dart';
import 'package:elections/features/candidate_sign_up/data/models/candidate_sign_up_request.dart';

class CandiDateSignUpRepo {
  final ApiServices _apiServices;

  CandiDateSignUpRepo(this._apiServices);

  Future<ApiResult> candiDateSignUp({
    required CandiDateSignUpRequest request,
    required File personalImage,
    required File nationalIdImage,
  }) async {
    final formData =
        await _createFormData(request, personalImage, nationalIdImage);

    try {
      final response = await _apiServices.candiDateSignUp(formData);
      return ApiResult.success(response);
    } on DioException catch (failure) {
      return ApiResult.failure(failure);
    }
  }

  Future<FormData> _createFormData(CandiDateSignUpRequest trainerSignUpRequest,
      File personalImage, File nationalIdImage) async {
    return FormData.fromMap({
      "Name": trainerSignUpRequest.name,
      "Email": trainerSignUpRequest.email,
      "Password": trainerSignUpRequest.password,
      "Gender": trainerSignUpRequest.gender,
      "PersonalImage": await MultipartFile.fromFile(personalImage.path, filename: personalImage.path.split('/').last),
      "NationalIdImage": await MultipartFile.fromFile(nationalIdImage.path, filename: nationalIdImage.path.split('/').last),
    });
  }


}
