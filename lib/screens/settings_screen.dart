import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/settings/settings_bloc.dart';
import '../blocs/settings/settings_event.dart';
import '../blocs/settings/settings_state.dart';
import 'login_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsBloc()..add(LoadSettings()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Pengaturan",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
          iconTheme: const IconThemeData(
              color: Colors.white), // Ubah warna ikon di AppBar menjadi putih
        ),
        body: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            return ListView.builder(
              itemCount: state.options.length,
              itemBuilder: (context, index) {
                final option = state.options[index];
                return ListTile(
                  leading: _getIconForOption(option),
                  title: Text(
                    option,
                    style: const TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    if (option == "Keluar") {
                      _handleLogout(context);
                    } else {
                      // Handle other settings options
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('$option dipilih')),
                      );
                    }
                  },
                );
              },
            );
          },
        ),
        backgroundColor: Colors.black,
      ),
    );
  }

  void _handleLogout(BuildContext context) {
    // Navigasi ke halaman login
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()), // Hapus 'const'
    );
  }

  Icon _getIconForOption(String option) {
    switch (option) {
      case "Ikuti dan undang teman":
        return const Icon(Icons.group, color: Colors.white);
      case "Notifikasi":
        return const Icon(Icons.notifications, color: Colors.white);
      case "Disukai":
        return const Icon(Icons.favorite, color: Colors.white);
      case "Tersimpan":
        return const Icon(Icons.bookmark, color: Colors.white);
      case "Arsipkan":
        return const Icon(Icons.archive, color: Colors.white);
      case "Privasi":
        return const Icon(Icons.lock, color: Colors.white);
      case "Aksesibilitas":
        return const Icon(Icons.accessibility, color: Colors.white);
      case "Akun":
        return const Icon(Icons.person, color: Colors.white);
      case "Bahasa":
        return const Icon(Icons.language, color: Colors.white);
      case "Bantuan":
        return const Icon(Icons.help, color: Colors.white);
      case "Tentang":
        return const Icon(Icons.info, color: Colors.white);
      case "Keluar":
        return const Icon(Icons.exit_to_app, color: Colors.white);
      default:
        return const Icon(Icons.settings, color: Colors.white);
    }
  }
}
