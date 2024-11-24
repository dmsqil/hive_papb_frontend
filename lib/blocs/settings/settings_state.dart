import 'package:equatable/equatable.dart';

class SettingsState extends Equatable {
  final List<String> options;

  const SettingsState({this.options = const []});

  @override
  List<Object?> get props => [options];
}
