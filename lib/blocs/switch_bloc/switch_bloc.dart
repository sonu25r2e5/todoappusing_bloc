import 'package:bloc_apps/blocs/bloc_export.dart';
import 'package:bloc_apps/blocs/switch_bloc/switch_state.dart';
import 'package:equatable/equatable.dart';

part 'switch_event.dart';

class SwitchBloc extends HydratedBloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(SwitchInitial(switchValue: false)) {
    on<SwitchOnEvent>((event, emit) {
      // TODO: implement event handler
      // it emits switch event,
      emit(SwitchState(switchValue: true));
    });
    // off value
    on<SwitchOffEvent>((event, emit) {
      // for emit the value
      emit(SwitchState(switchValue: false));
    });
  }

  @override
  SwitchState? fromJson(Map<String, dynamic> json) {
    return SwitchState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(SwitchState state) {
    // for returning the state of color we represent here.
    return state.toMap();
  }
}
