import 'package:bloc/bloc.dart';
import 'settings_event.dart';
import 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const SettingsState()) {
    on<LoadSettings>((event, emit) {
      // Simulate loading settings options
      const settingsOptions = [
        "Ikuti dan undang teman",
        "Notifikasi",
        "Disukai",
        "Tersimpan",
        "Arsipkan",
        "Privasi",
        "Aksesibilitas",
        "Akun",
        "Bahasa",
        "Bantuan",
        "Tentang",
        "Keluar",
      ];
      emit(SettingsState(options: settingsOptions));
    });
  }
}
