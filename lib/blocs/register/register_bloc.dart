import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/auth_service.dart';
import 'register_event.dart';
import 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthService authService;

  RegisterBloc({required this.authService}) : super(RegisterInitial()) {
    on<RegisterSubmitted>((event, emit) async {
      emit(RegisterLoading());
      try {
        final result = await authService.register(
          event.name,
          event.email,
          event.password,
          event.confirmPassword,
        );
        
        if (result['success'] == true) {
          emit(RegisterSuccess());
        } else {
          emit(RegisterFailure(error: result['message'] ?? "Gagal mendaftar Register_Bloc."));
        }
      } catch (e) {
        emit(RegisterFailure(error: e.toString()));
      }
    });
  }
}
