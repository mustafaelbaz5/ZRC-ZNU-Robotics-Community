import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/core/auth/logic/cubit/auth_cubit.dart';
import 'package:zrc/core/extensions/navigation.dart';
import 'package:zrc/core/router/routes.dart';
import 'package:zrc/core/themes/app_colors.dart';
import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/utils/regex.dart';
import 'package:zrc/core/utils/spacing.dart';
import 'package:zrc/core/widgets/custom_text_form_.dart';
import 'package:zrc/core/widgets/custom_text_button.dart';
import 'package:zrc/core/widgets/show_error_dialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLoginPressed() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthCubit>().login(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          context.pushReplacementNamed(Routes.studentHomeScreen);
        } else if (state is AuthError) {
          showErrorDialog(
            context: context,
            title: 'Login Failed',
            message: state.errorMessage,
          );
        }
      },
      builder: (context, state) {
        final isLoading = state is AuthLoading;

        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                // Background shapes
                Positioned(
                  top: -100,
                  left: -100,
                  child: Container(
                    width: 200.w,
                    height: 200.w,
                    decoration: BoxDecoration(
                      color: AppColors.lightBlue.withAlpha(50),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -120,
                  right: -80,
                  child: Container(
                    width: 250.w,
                    height: 250.w,
                    decoration: BoxDecoration(
                      color: AppColors.lightBlue.withAlpha(50),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Positioned(
                  top: 150,
                  right: -60,
                  child: Container(
                    width: 150.w,
                    height: 150.w,
                    decoration: BoxDecoration(
                      color: AppColors.lightBlue.withAlpha(30),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),

                // Login form
                SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 40.h,
                  ),
                  child: Center(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          verticalSpacing(40),

                          // Title
                          Text(
                            'Welcome Back',
                            textAlign: TextAlign.center,
                            style: AppTextStyles.font32BlackBold.copyWith(
                              fontSize: 32.sp,
                            ),
                          ),
                          verticalSpacing(8),
                          Text(
                            'Login with your university email and password',
                            textAlign: TextAlign.center,
                            style: AppTextStyles.font16GreyRegular.copyWith(),
                          ),
                          verticalSpacing(60),
                          // Email Field
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Email',
                              style: AppTextStyles.font16BlackBold.copyWith(
                                fontSize: 16.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          verticalSpacing(8),
                          CustomTextFormField(
                            controller: _emailController,
                            hintText: 'Enter your email',
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Email cannot be empty';
                              } else if (!AppRegex.isEmailValid(value.trim())) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                          ),
                          verticalSpacing(24),

                          // Password Field
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Password',
                              style: AppTextStyles.font16BlackBold.copyWith(
                                fontSize: 16.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          verticalSpacing(8),
                          CustomTextFormField(
                            controller: _passwordController,
                            hintText: 'Enter your password',
                            isObscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password cannot be empty';
                              }
                              return null;
                            },
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Forgot Password?',
                                style: AppTextStyles.font16BlackRegular
                                    .copyWith(color: AppColors.lightBlue),
                              ),
                            ),
                          ),
                          verticalSpacing(24),

                          // Login Button
                          CustomTextButton(
                            buttonText: 'Login',
                            onPressed: isLoading ? null : _onLoginPressed,
                            isLoading: isLoading,
                            buttonHeight: 56.h,
                            buttonWidth: double.infinity,
                            borderRadius: 12.r,
                          ),
                          verticalSpacing(40),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
