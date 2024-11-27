import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'services/auth_service.dart';
import 'blocs/auth/auth_bloc.dart';
import 'blocs/auth/auth_event.dart';
import 'blocs/auth/auth_state.dart';
import 'blocs/register/register_bloc.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/home_screen.dart';
import 'screens/add_post_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/search_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/activity_screen.dart';

void main() {
  final authService = AuthService(); // Initialize authService globally

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(authService: authService)..add(AppStarted()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
// LoginSubmitted LoginSubmitted
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = AuthService(); // Shared AuthService instance

    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(authService: authService)..add(AppStarted()),
        ),
        BlocProvider<RegisterBloc>(
          create: (context) => RegisterBloc(authService: authService),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthSuccess) {
              return const HomeScreen();
            } else if (state is AuthFailure) {
              return LoginScreen(); // Or display an error page
            } else {
              return LoginScreen();
            }
          },
        ),
        routes: {
          '/register': (context) => RegisterScreen(),
          '/home': (context) => const HomeScreen(),
          '/search': (context) => const SearchScreen(),
          '/add_post': (context) => AddPostScreen(),
          // favourite
          '/profile': (context) => ProfileScreen(),
          '/settings': (context) => const SettingsScreen(),
          '/activity': (context) => ActivityScreen(),
        },
      ),
    );
  }
}
