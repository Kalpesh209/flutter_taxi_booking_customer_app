import 'package:equatable/equatable.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();
}

class InitialSettingsState extends SettingsState {
  @override
  List<Object> get props => [];
}
