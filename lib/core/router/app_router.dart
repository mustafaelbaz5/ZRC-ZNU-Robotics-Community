import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modules/student/core/widgets/student_scaffold.dart';
import '../../modules/student/features/courses/ui/courses_screen.dart';
import '../../modules/student/features/home/ui/home_screen.dart';
import '../../modules/student/features/materials/ui/materials_screen.dart';
import '../../modules/student/features/profile/ui/profile_screen.dart';
import '../auth/logic/cubit/auth_cubit.dart';
import '../auth/ui/login_screen.dart';
import '../onboarding/ui/on_boarding_screen.dart';
import 'routes.dart';

class AppRouter {
  Route<dynamic>? generateRoute(RouteSettings settings) {
    // ignore: unused_local_variable
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());

      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(),
            child: const LoginScreen(),
          ),
        );
      // Student module
      case Routes.studentScaffold:
        return MaterialPageRoute(builder: (_) => const StudentScaffold());
      case Routes.studentHomeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.studentCoursesScreen:
        return MaterialPageRoute(builder: (_) => const CoursesScreen());
      case Routes.studentMaterialScreen:
        return MaterialPageRoute(builder: (_) => const MaterialsScreen());
      case Routes.studentProfileScreen:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());

      //Instructor module
      default:
        return null;
    }
  }
}
