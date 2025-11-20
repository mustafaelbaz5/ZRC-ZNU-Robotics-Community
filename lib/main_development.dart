import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/dependency_injection.dart';
import 'core/router/app_router.dart';
import 'zrc_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  await ScreenUtil.ensureScreenSize();
  runApp(ZrcApp(appRouter: AppRouter()));
}

// flutter run --release --flavor development --target lib/main_development.dart
