import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/core/extensions/navigation.dart';
import 'package:zrc/core/router/routes.dart';
import 'package:zrc/core/themes/app_colors.dart';
import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/utils/spacing.dart';
import 'package:zrc/core/widgets/custom_text_form_.dart';
import 'package:zrc/core/widgets/custom_text_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                verticalSpacing(10),

                // Title
                Text(
                  'Login',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.font32BlackBold.copyWith(
                    fontSize: 32.sp,
                  ),
                ),
                verticalSpacing(8),
                Text(
                  'Login with your University email Account And Password',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.font16GreyRegular,
                ),
                verticalSpacing(60),

                // Email Field
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Email',
                    style: AppTextStyles.font16BlackBold.copyWith(
                      fontSize: 16.sp,
                    ),
                  ),
                ),
                verticalSpacing(8),
                const CustomTextFormField(
                  hintText: 'Enter your email',
                  keyboardType: TextInputType.emailAddress,
                ),
                verticalSpacing(24),

                // Password Field
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Password',
                    style: AppTextStyles.font16BlackBold.copyWith(
                      fontSize: 16.sp,
                    ),
                  ),
                ),
                verticalSpacing(8),
                const CustomTextFormField(
                  hintText: 'Enter your password',
                  isObscureText: true,
                ),

                // Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // TODO: Navigate to forgot password
                    },
                    child: Text(
                      'Forgot Password?',
                      style: AppTextStyles.font16BlackRegular.copyWith(
                        color: AppColors.lightBlue,
                      ),
                    ),
                  ),
                ),
                verticalSpacing(24),

                // Login Button
                CustomTextButton(
                  buttonText: 'Login',
                  onPressed: () {
                    context.pushReplacementNamed(Routes.studentHomeScreen);
                  },
                  buttonHeight: 56.h,
                  buttonWidth: double.infinity,
                  borderRadius: 12.r,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
