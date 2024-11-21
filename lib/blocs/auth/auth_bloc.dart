import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../screens/home_screen.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginSubmitted>((event, emit) async {
      emit(AuthLoading());
      await Future.delayed(const Duration(seconds: 2)); // Simulasi API

      if (event.username == "user" && event.password == "password") {
        emit(AuthSuccess());
        // Navigasi ke halaman beranda setelah login berhasil
        Navigator.pushReplacementNamed(event.context, '/home');
      } else {
        emit(AuthFailure("Nama pengguna atau kata sandi salah."));
      }
    });
  }
}
