import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_font_weight.dart';

class AppTextStyles {
  static TextStyle font32BlackBold = const TextStyle(
    fontSize: 32,
    fontWeight: FontWeightHelper.bold,
    color: Colors.black,
  );
  static TextStyle font18GreyRegular = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.grey,
  );
  static TextStyle font16WhiteRegular = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeightHelper.regular,
    color: Colors.white,
  );
}
