import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import library SVG
import '../blocs/auth/auth_bloc.dart';
import '../blocs/auth/auth_event.dart';
import '../blocs/auth/auth_state.dart';
import '../blocs/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset:
          true, // Menyesuaikan tampilan ketika keyboard muncul
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                  height: 50), // Jarak di atas teks "Bahasa Indonesia"
              const Text(
                'Bahasa Indonesia',
                style: TextStyle(
                  color: Color.fromARGB(255, 191, 191, 191),
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 100),
              SvgPicture.asset(
                'assets/logo.svg', // Path file SVG
                width: 120, // Sesuaikan ukuran lebar
                height: 120, // Sesuaikan ukuran tinggi
              ),
              const SizedBox(height: 100),
              CustomTextField(
                controller: usernameController,
                hintText: "nama pengguna, email atau nama telepon",
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: passwordController,
                hintText: "Kata Sandi",
                obscureText: true,
              ),
              const SizedBox(height: 30),
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Login berhasil!"),
                    ));
                    Navigator.pushReplacementNamed(context, '/home');
                  } else if (state is AuthFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(state.error),
                    ));
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return const CircularProgressIndicator();
                  }

                  return ElevatedButton(
                    onPressed: () {
                      // Memastikan kita mengirimkan username, password, dan context
                      context.read<AuthBloc>().add(
                            LoginSubmitted(
                              username: usernameController.text,
                              password: passwordController.text,
                              context: context, // Menyertakan context di sini
                            ),
                          );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text(
                      "Masuk",
                      style: TextStyle(
                        color: Colors.white, // Ubah warna teks menjadi putih
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                  height: 230), // Jarak antara button dan teks "© Meta"
              SvgPicture.asset(
                'assets/meta.svg',
                width: 14, // Sesuaikan ukuran lebar
                height: 14, // Sesuaikan ukuran tinggi
              ),
            ],
          ),
        ),
      ),
    );
  }
}
