import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../error/types/error_handler.dart';
import '../../../error/models/app_error.dart';
import '../../../utils/secure_storage.dart';

class AuthService {
  final _supabase = Supabase.instance.client;
  final _secureStorage = SecureStorage();

  /// Logs in the user and stores user ID in secure storage
  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      final userId = response.user?.id;
      if (userId != null) {
        await _secureStorage.saveString(key: 'user_id', value: userId);
      }

      debugPrint('✅ User logged in successfully: ${response.user?.id}');
    } catch (e) {
      // Convert to AppError (already has user-friendly message)
      final appError = ErrorHandler.handle(e);

      debugPrint('❌ Login failed: ${appError.message}');

      // Rethrow AppError directly
      throw AppError(
        message: appError.message, // user-friendly message
        type: appError.type,
        code: appError.code,
        originalError: appError.originalError,
      );
    }
  }
}
