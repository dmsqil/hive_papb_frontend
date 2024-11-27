import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/register/register_bloc.dart';
import '../blocs/register/register_event.dart';
import '../blocs/register/register_state.dart';
import '../services/auth_service.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Registrasi")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Nama"),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: "Password"),
            ),
            TextField(
              controller: confirmPasswordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: "Konfirmasi Password"),
            ),
            const SizedBox(height: 20),
            BlocConsumer<RegisterBloc, RegisterState>(
              listener: (context, state) {
                if (state is RegisterSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Registrasi berhasil!"),
                  ));
                  Navigator.pushReplacementNamed(context, '/home');
                } else if (state is RegisterFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(state.error),
                  ));
                }
              },
              builder: (context, state) {
                if (state is RegisterLoading) {
                  return const CircularProgressIndicator();
                }

                return ElevatedButton(
                  onPressed: () {
                    context.read<RegisterBloc>().add(RegisterSubmitted(
                          name: nameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          confirmPassword: confirmPasswordController.text,
                        ));
                  },
                  child: const Text("Daftar"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
