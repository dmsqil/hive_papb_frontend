import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../services/auth_service.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService authService;

  AuthBloc({required this.authService}) : super(AuthInitial()) {
    on<LoginSubmitted>((event, emit) async {
      emit(AuthLoading());

      try {
        final result = await authService.login(event.username, event.password);

        if (result['success'] == true) {
          emit(AuthSuccess());
        } else {
          emit(AuthFailure(
              error: result['message'] ?? "Login gagal, coba lagi."));
        }
      } catch (e) {
        emit(AuthFailure(
            error: "Tidak dapat terhubung ke server, periksa koneksi Anda."));
      }
    });
  }
}
