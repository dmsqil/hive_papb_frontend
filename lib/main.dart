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
import 'screens/search_screen.dart';
import 'screens/settings_screen.dart';

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
        // Tambahkan provider lainnya jika diperlukan
        BlocProvider<RegisterBloc>(
          create: (context) => RegisterBloc(authService: authService),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/login', // Route awal
        routes: {
          '/login': (context) => LoginScreen(),
          '/register': (context) => RegisterScreen(),
          '/home': (context) => const HomeScreen(),
          '/add_post': (context) => AddPostScreen(),
          '/profile': (context) => ProfileScreen(),
          '/search': (context) => const SearchScreen(),
          '/settings': (context) => const SettingsScreen(),
        },
        theme: ThemeData.dark(), // Contoh tema gelap, bisa disesuaikan
      ),
    );
  }
}
