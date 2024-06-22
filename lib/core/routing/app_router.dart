import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elections/core/di/dependency_injection.dart';
import 'package:elections/core/routing/routes.dart';
import 'package:elections/features/candidate_login/logic/cubit/candidate_login_cubit.dart';
import 'package:elections/features/candidate_login/ui/candidate_login_screen.dart';
import 'package:elections/features/candidate_sign_up/logic/cubit/candidate_sign_up_cubit.dart';
import 'package:elections/features/candidate_sign_up/ui/candidate_sign_up_screen.dart';
import 'package:elections/features/choose_user/choose_user.dart';
import 'package:elections/features/voter_home/logic/cubit/voter_home_cubit.dart';
import 'package:elections/features/voter_home/ui/choose_category_voter_screen.dart';
import 'package:elections/features/voter_home/ui/voter_home_screen.dart';
import 'package:elections/features/voter_login/logic/cubit/voter_login_cubit.dart';
import 'package:elections/features/voter_login/ui/voter_login_screen.dart';
import 'package:elections/features/voter_sign_up/logic/cubit/voter_sign_up_cubit.dart';
import 'package:elections/features/voter_sign_up/ui/voter_sign_up_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  print('Navigating to: ${settings.name}'); // Debug statement
  switch (settings.name) {
    case Routes.chooseUser:
      return MaterialPageRoute(
        builder: (_) => const ChooseAccountUser(),
      );
    case Routes.candidateSignUpScreen:
      return MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: getIt<CandiDateSignUpCubit>(),
          child: const CandiDateSignUpScreen(),
        ),
      );
    case Routes.candidateLoginScreen:
      return MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: getIt<CandiDateLoginCubit>(),
          child: const CandiDateLoginScreen(),
        ),
      );
    case Routes.voterSignUpScreen:
      return MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: getIt<VoterSignUpCubit>(),
          child: const VoterSignUpScreen(),
        ),
      );
    case Routes.voterLoginScreen:
      return MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: getIt<VoterLoginCubit>(),
          child: const VoterLoginScreen(),
        ),
      );
    case Routes.voterChooseCategory:
      return MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: getIt<VoterHomeCubit>(),
          child: const ChooseCategoryVoterScreen(),
        ),
      );
    case Routes.voterHomeScreen:
      return MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: getIt<VoterHomeCubit>(),
          child: const VoterHomeScreen(),
        ),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}