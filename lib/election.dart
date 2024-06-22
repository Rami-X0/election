import 'package:elections/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routing/app_router.dart' as route;

class ElectionsApp extends StatelessWidget {
  const ElectionsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        onGenerateRoute: route.generateRoute,
        initialRoute:Routes.voterLoginScreen
      ),
    );
  }
}
