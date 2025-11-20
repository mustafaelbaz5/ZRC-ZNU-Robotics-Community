import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/core/router/app_router.dart';
import 'package:zrc/core/router/routes.dart';

class ZrcApp extends StatelessWidget {
  const ZrcApp({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // ToDo :App Main Size
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.onBoardingScreen,
        onGenerateRoute: AppRouter().generateRoute,
        title: 'ZRC – ZNU Robotics Community',
        // theme: ThemeData(
        //   primaryColor: ColorsManger.mainBlue,
        //   scaffoldBackgroundColor: Colors.white,
        // ),
      ),
    );
  }
}
