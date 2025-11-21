import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/core/auth/logic/cubit/auth_cubit.dart';
import 'package:zrc/core/extensions/navigation.dart';
import 'package:zrc/core/router/routes.dart';
import 'package:zrc/core/themes/app_colors.dart';
import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/utils/spacing.dart';
import 'package:zrc/core/widgets/custom_text_form_.dart';
import 'package:zrc/core/widgets/custom_text_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          // Navigate to Home Screen after successful login
          context.pushReplacementNamed(Routes.studentHomeScreen);
        } else if (state is AuthError) {
          // Show error message
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        final isLoading = state is AuthLoading;

        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    verticalSpacing(10),
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
                    CustomTextFormField(
                      controller: _emailController,
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
                    CustomTextFormField(
                      controller: _passwordController,
                      hintText: 'Enter your password',
                      isObscureText: true,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
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
                      buttonText: isLoading ? 'Logging in...' : 'Login',
                      onPressed: isLoading
                          ? null
                          : () {
                              context.read<AuthCubit>().login(
                                email: _emailController.text.trim(),
                                password: _passwordController.text.trim(),
                              );
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
      },
    );
  }
}
