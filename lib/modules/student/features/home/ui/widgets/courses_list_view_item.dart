import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/utils/spacing.dart';

import 'package:zrc/modules/student/features/home/data/model/courses_card_model.dart';

class CoursesListViewCard extends StatelessWidget {
  final CoursesCardModel coursesCardModel;
  const CoursesListViewCard({super.key, required this.coursesCardModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 243, 243, 243),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Course Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.asset(
              coursesCardModel.image,
              height: 100.h,
              width: 100.w,
              fit: BoxFit.cover,
            ),
          ),

          horizontalSpacing(12),

          // Course Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  coursesCardModel.title,
                  style: AppTextStyles.font16BlackBold,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                // Description
                Text(
                  coursesCardModel.description,
                  style: AppTextStyles.font13greyRegular.copyWith(
                    wordSpacing: .5.w,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                verticalSpacing(16),
                // Instructor &
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      coursesCardModel.instructor,
                      style: AppTextStyles.font13BlueBold,
                    ),
                    Text(
                      coursesCardModel.data,
                      style: AppTextStyles.font13greyRegular,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
