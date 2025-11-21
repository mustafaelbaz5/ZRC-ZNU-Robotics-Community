import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zrc/core/auth/data/repo/auth_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo _authRepo;

  AuthCubit({AuthRepo? authRepo})
      : _authRepo = authRepo ?? AuthRepo(),
        super(AuthInitial());

  /// Login method
  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());

    try {
      final AuthResponse res = await _authRepo.login(
        email: email,
        password: password,
      );

      final userId = res.user?.id ?? "";

      emit(AuthSuccess(userId));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
