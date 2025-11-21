import 'package:flutter/material.dart';
import 'package:zrc/core/themes/app_colors.dart';
import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/utils/spacing.dart';
import 'package:zrc/modules/student/features/home/ui/widgets/categories_list_view.dart';
import 'package:zrc/modules/student/features/home/ui/widgets/courses_list_view.dart';
import 'package:zrc/modules/student/features/home/ui/widgets/home_app_bar.dart';
import 'package:zrc/modules/student/features/home/ui/widgets/home_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpacing(20),
              const HomeAppBar(userName: 'Mustafa', userId: '51546'),
              verticalSpacing(20),
              const HomeHeader(),
              verticalSpacing(20),
              Text("Categories", style: AppTextStyles.font16BlackBold),
              verticalSpacing(12),
              const CategoriesListView(),
              Row(
                children: [
                  Text("Courses", style: AppTextStyles.font16BlackBold),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: Text("See all", style: AppTextStyles.font13BlueBold),
                  ),
                  horizontalSpacing(4),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.lightBlue,
                    size: 16,
                  ),
                  horizontalSpacing(10),
                ],
              ),

              const CoursesListView(), //
              verticalSpacing(20),
            ],
          ),
        ),
      ),
    );
  }
}
