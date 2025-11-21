import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/core/utils/app_assets.dart';
import 'package:zrc/modules/student/features/home/data/model/courses_card_model.dart';
import 'package:zrc/modules/student/features/home/ui/widgets/courses_list_view_item.dart';

class CoursesListView extends StatelessWidget {
  const CoursesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Column(
        children: courses
            .map(
              (course) => Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: CoursesListViewCard(coursesCardModel: course),
              ),
            )
            .toList(),
      ),
    );
  }
}

List<CoursesCardModel> courses = [
  CoursesCardModel(
    image: AppAssets.onBoardingBanner1,
    title: 'Mathematics',
    description: 'Learn the basics of algebra, geometry, and calculus.',
    instructor: 'Mustafa Elbaz',
    data: '17 - 5 - 2023',
  ),
  CoursesCardModel(
    image: AppAssets.onBoardingBanner1,
    title: 'Physics',
    description: 'Explore the laws of nature, motion, and energy.',
    instructor: 'John Doe',
    data: '17 - 5 - 2023s',
  ),
  CoursesCardModel(
    image: AppAssets.onBoardingBanner1,
    title: 'Mathematics',
    description: 'Learn the basics of algebra, geometry, and calculus.',
    instructor: 'Mustafa Elbaz',
    data: '17 - 5 - 2023',
  ),
  CoursesCardModel(
    image: AppAssets.onBoardingBanner1,
    title: 'Physics',
    description: 'Explore the laws of nature, motion, and energy.',
    instructor: 'John Doe',
    data: '17 - 5 - 2023',
  ),
  CoursesCardModel(
    image: AppAssets.onBoardingBanner1,
    title: 'Mathematics',
    description: 'Learn the basics of algebra, geometry, and calculus.',
    instructor: 'Mustafa Elbaz',
    data: '17 - 5 - 2023',
  ),
  CoursesCardModel(
    image: AppAssets.onBoardingBanner1,
    title: 'Physics',
    description: 'Explore the laws of nature, motion, and energy.',
    instructor: 'John Doe',
    data: '17 - 5 - 2023',
  ),
];
