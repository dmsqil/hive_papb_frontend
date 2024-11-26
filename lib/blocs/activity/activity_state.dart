import 'package:equatable/equatable.dart';

class ActivityState extends Equatable {
  final List<Map<String, dynamic>> activity;

  ActivityState({required this.activity});

  @override
  List<Object?> get props => [activity];
}

class ActivityInitial extends ActivityState {
  ActivityInitial() : super(activity: []);
}

class ActivityLoaded extends ActivityState {
  ActivityLoaded({required List<Map<String, dynamic>> activity})
      : super(activity: activity);
}
