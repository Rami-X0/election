import 'package:elections/core/caching/app_shared_pref.dart';
import 'package:elections/core/di/dependency_injection.dart';
import 'package:elections/core/helper/bloc_observer.dart';
import 'package:elections/election.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  setupGetIt();
  await AppSharedPref.initSharedPref();
  await ScreenUtil.ensureScreenSize();
  runApp(const ElectionsApp());
}
