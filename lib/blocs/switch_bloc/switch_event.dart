part of 'switch_bloc.dart';

sealed class SwitchEvent extends Equatable {
  const SwitchEvent();

  @override
  List<Object> get props => [];
}

// we created two event
// frist switch on event and off event.
class SwitchOnEvent extends SwitchEvent {}

class SwitchOffEvent extends SwitchEvent {}
