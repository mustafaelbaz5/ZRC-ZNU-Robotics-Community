import 'package:zrc/core/auth/data/service/auth_service.dart';
import 'package:zrc/core/error/models/app_error.dart';

class AuthRepo {
  final AuthService _authService;

  AuthRepo({AuthService? authService})
    : _authService = authService ?? AuthService();

  /// Login user using email & password
  Future<void> login({required String email, required String password}) async {
    try {
      await _authService.loginUser(email: email, password: password);
    } catch (e) {
      // Propagate AppError
      if (e is AppError) {
        rethrow;
      }
      // Convert any other exception to AppError
      throw AppError.unknown('Something went wrong. Please try again.');
    }
  }
}
