import 'package:flutter/material.dart';

abstract class AuthEvent {}

class LoginSubmitted extends AuthEvent {
  final String username;
  final String password;
  final BuildContext context; // Menambahkan context ke event

  // Pastikan constructor menerima parameter ini
  LoginSubmitted({required this.username, required this.password, required this.context});
}


