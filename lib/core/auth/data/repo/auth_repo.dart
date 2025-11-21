import '../../../error/models/app_error.dart';
import '../service/auth_service.dart';

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
