import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'services/auth_service.dart'; // Service untuk koneksi ke API
import 'blocs/auth/auth_bloc.dart';
import 'screens/login_screen.dart';

import 'blocs/register/register_bloc.dart';
import 'screens/register_screen.dart';

import 'screens/home_screen.dart';
import 'screens/add_post_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Inisialisasi AuthService
    final authService = AuthService();

    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(authService: authService),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/login', // Route awal
        routes: {
          '/login': (context) => LoginScreen(), // Halaman login
          '/register': (context) => RegisterScreen(),
          '/home': (context) => const HomeScreen(), // Halaman home
          '/add_post': (context) => AddPostScreen(), // Halaman tambah post
          '/profile': (context) => const ProfileScreen(), // Halaman profil
        },
        theme: ThemeData.dark(), // Contoh tema gelap, bisa disesuaikan
      ),
    );
  }
}
