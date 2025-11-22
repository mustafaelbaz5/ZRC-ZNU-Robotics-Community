import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'firebase_options.dart';

import 'core/di/dependency_injection.dart';
import 'core/router/app_router.dart';
import 'zrc_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  await ScreenUtil.ensureScreenSize();
  runApp(ZrcApp(appRouter: AppRouter()));
}
// flutter run --release --flavor production --target lib/main_production.dart