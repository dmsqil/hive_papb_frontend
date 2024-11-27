import 'package:flutter/material.dart';
import '../blocs/auth/auth_state.dart';
import '../blocs/auth/auth_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../blocs/auth/auth_bloc.dart';
import '../services/auth_service.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        // Dismiss the keyboard when tapping outside input fields
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    // Language Selector
                    const Text(
                      'Bahasa Indonesia',
                      style: TextStyle(
                        color: Color(0xFFBFBFBF),
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 50),
                    // Logo
                    SvgPicture.asset(
                      'assets/logo.svg',
                      width: 64,
                      height: 64,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 50),
                    // Username/Email Field
                    _buildTextField(
                      controller: emailController,
                      hintText: "Email",
                    ),
                    const SizedBox(height: 20),
                    // Password Field
                    _buildTextField(
                      controller: passwordController,
                      hintText: "Kata sandi",
                      obscureText: true,
                    ),
                    const SizedBox(height: 30),
                    // Login Button with BlocConsumer
                    BlocConsumer<AuthBloc, AuthState>(
                      listener: (context, state) {
                        if (state is AuthSuccess) {
                          // Success Snackbar and Navigation
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Login berhasil!"),
                              backgroundColor: Colors.green,
                            ),
                          );
                          Navigator.pushReplacementNamed(context, '/home');
                        } else if (state is AuthFailure) {
                          // Failure Snackbar
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(state.error),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is AuthLoading) {
                          return const CircularProgressIndicator();
                        }

                        return ElevatedButton(
                          onPressed: () {
                            if (_validateInputs(context)) {
                              context.read<AuthBloc>().add(
                                    LoginSubmitted(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    ),
                                  );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            minimumSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            "Masuk",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    // Register Link
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: const Text(
                        "Belum punya akun? Daftar",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Footer Section
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: const Text(
                "Meta",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Reusable TextField Widget
  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    bool obscureText = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: const Color(0xFF1C1C1C),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }

  // Validate input fields
  bool _validateInputs(BuildContext context) {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Email dan kata sandi harus diisi!"),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }

    // Simple email format validation
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(emailController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Format email tidak valid!"),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }

    return true;
  }
}
