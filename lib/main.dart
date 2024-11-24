import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/auth/auth_bloc.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/add_post_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/search_screen.dart';
import 'screens/settings_screen.dart'; // Tambahkan import untuk SearchScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/login',
        routes: {
          '/login': (context) => LoginScreen(),
          '/home': (context) => const HomeScreen(),
          '/add_post': (context) => AddPostScreen(),
          '/profile': (context) => ProfileScreen(),
          '/search': (context) => const SearchScreen(),
          '/settings': (context) =>
              const SettingsScreen(), // Tambahkan rute ke SearchScreen
        },
      ),
    );
  }
}
