import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../services/auth_service.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService authService;

  AuthBloc({required this.authService}) : super(AuthInitial()) {
    on<AppStarted>((event, emit) async {
      try {
        final isAuthenticated = await authService.isAuthenticated();
        if (isAuthenticated) {
          emit(AuthSuccess());
        } else {
          emit(AuthInitial());
        }
      } catch (e) {
        emit(AuthFailure(error: "Failed to check authentication: $e"));
      }
    });

    on<LoginSubmitted>((event, emit) async {
      emit(AuthLoading());

      try {
        final result = await authService.login(event.email, event.password);
      
        if (result['success'] == true) {
          print("succes dijalankan");
          emit(AuthSuccess()); // ii
        } else {
          emit(AuthFailure(
              error: result['message'] ?? "Login gagal, coba lagi."));
        }
      } catch (e) { 
        print("Ada Kesalahan: $e");
        emit(AuthFailure(error: e.toString()));
      }
    });
  }
}
