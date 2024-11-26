import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import '../../services/auth_service.dart';

class AuthController extends Bloc<AuthEvent, AuthState> {
  final AuthService authService;

  AuthController({required this.authService}) : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is LoginSubmitted) {
      yield AuthLoading();

      try {
        final result = await authService.login(event.email, event.password);
        
        // Menangani response sukses
        if (result['success'] == true) {
          yield AuthSuccess();
        } else {
          yield AuthFailure(error: result['message'] ?? 'Unknown error');
        }
      } catch (e) {
        yield AuthFailure(error: e.toString());
      }
    }
  }
}
