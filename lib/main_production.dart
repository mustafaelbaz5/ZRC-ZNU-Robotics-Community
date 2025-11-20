import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/core/di/dependency_injection.dart';
import 'package:zrc/core/router/app_router.dart';
import 'package:zrc/zrc_app.dart';


void main() async {
  setupGetIt();
  await ScreenUtil.ensureScreenSize();
  runApp(ZrcApp(appRouter: AppRouter()));
}
// flutter run --release --flavor production --target lib/main_production.dart