import 'package:dio/dio.dart';
import 'package:elections/core/networking/api_services.dart';
import 'package:elections/core/networking/dio_factory.dart';
import 'package:elections/features/candidate_login/data/repo/candidate_login_repo.dart';
import 'package:elections/features/candidate_login/logic/cubit/candidate_login_cubit.dart';
import 'package:elections/features/candidate_sign_up/data/repo/candidate_sign_up_repo.dart';
import 'package:elections/features/candidate_sign_up/logic/cubit/candidate_sign_up_cubit.dart';
import 'package:elections/features/voter_home/data/repo/voter_home_repo.dart';
import 'package:elections/features/voter_home/logic/cubit/voter_home_cubit.dart';
import 'package:elections/features/voter_login/data/repo/voter_login_repo.dart';
import 'package:elections/features/voter_login/logic/cubit/voter_login_cubit.dart';
import 'package:elections/features/voter_sign_up/data/repo/voter_sign_up_repo.dart';
import 'package:elections/features/voter_sign_up/logic/cubit/voter_sign_up_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() async {
  Dio dio = await DioFactory.getDio();
  //ToDo: apiServices
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(dio));

  // ToDo: signUpCandiDate
  getIt.registerLazySingleton<CandiDateSignUpCubit>(
      () => CandiDateSignUpCubit(getIt()));
  getIt.registerLazySingleton<CandiDateSignUpRepo>(
      () => CandiDateSignUpRepo(getIt()));

  // ToDo: loginCandiDate
  getIt.registerLazySingleton<CandiDateLoginCubit>(
      () => CandiDateLoginCubit(getIt()));
  getIt.registerLazySingleton<CandiDateLoginRepo>(
      () => CandiDateLoginRepo(getIt()));

  // ToDo: voterSignUp
  getIt
      .registerLazySingleton<VoterSignUpCubit>(() => VoterSignUpCubit(getIt()));
  getIt.registerLazySingleton<VoterSignUpRepo>(() => VoterSignUpRepo(getIt()));

  // ToDo: voterLogin
  getIt.registerLazySingleton<VoterLoginCubit>(() => VoterLoginCubit(getIt()));
  getIt.registerLazySingleton<VoterLoginRepo>(() => VoterLoginRepo(getIt()));

  // ToDo: voterHome
  getIt
      .registerLazySingleton<VoterHomeCubit>(() => VoterHomeCubit(getIt()));
  getIt
      .registerLazySingleton<VoterHomeRepo>(() => VoterHomeRepo(getIt()));
}
