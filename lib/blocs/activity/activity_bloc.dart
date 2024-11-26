import 'package:flutter_bloc/flutter_bloc.dart';
import 'activity_event.dart';
import 'activity_state.dart';

class ActivityBloc extends Bloc<ActivityEvent, ActivityState> {
  ActivityBloc() : super(ActivityInitial()) {
    on<LoadActivity>((event, emit) {
      final data = [
        {'username': 'sabilah59', 'waktu': '12j', 'status': 'Mengikuti Anda'},
        {'username': 'sehatterrsama', 'waktu': '2h', 'status': 'Mengikuti Anda'},
        {'username': 'mat_gandhi', 'waktu': '4h', 'status': 'Menyukai foto Anda'},
        {'username': 'zuck', 'waktu': '1m', 'status': 'Mengikuti Anda'},
        {'username': 'Melon Mask', 'waktu': '2m', 'status': 'Mengikuti Anda'},
      ];
      emit(ActivityLoaded(activity: data));
    });
  }
}
