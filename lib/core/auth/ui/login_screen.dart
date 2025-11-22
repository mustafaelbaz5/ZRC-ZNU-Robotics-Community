import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../logic/cubit/auth_cubit.dart';
import 'widgets/background_shapes.dart';
import 'widgets/log_in_header.dart';
import '../../extensions/navigation.dart';
import '../../router/routes.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_text_styles.dart';
import '../../utils/regex.dart';
import '../../utils/spacing.dart';
import '../../widgets/custom_text_form_.dart';
import '../../widgets/custom_text_button.dart';
import '../../widgets/show_error_dialog.dart';

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
          context.pushReplacementNamed(Routes.studentScaffold);
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
                const BackgroundShapes(),

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
                          verticalSpacing(50),
                          const LogInHeader(),
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Email cannot be empty';
                              } else if (!AppRegex.isEmailValid(value.trim())) {
                                return 'Please enter a valid email[*****@ais.znu.edu.eg]';
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
