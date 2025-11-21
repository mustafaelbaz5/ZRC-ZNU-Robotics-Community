import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:zrc/core/auth/data/service/auth_service.dart';

class AuthRepo {
  final AuthService _authService;

  AuthRepo({AuthService? authService})
    : _authService = authService ?? AuthService();

  /// Login user using email & password
  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _authService.loginUser(
        email: email,
        password: password,
      );

      return result;
    } catch (e) {
      rethrow;
    }
  }
}
