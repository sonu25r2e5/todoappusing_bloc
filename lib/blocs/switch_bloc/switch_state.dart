// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class SwitchState extends Equatable {
  final bool switchValue;
  const SwitchState({required this.switchValue});

  // for geeting the value we need proprs
  @override
  List<Object> get props => [switchValue];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'switchValue': switchValue};
  }

  factory SwitchState.fromMap(Map<String, dynamic> map) {
    return SwitchState(switchValue: map['switchValue'] as bool);
  }
}

final class SwitchInitial extends SwitchState {
  const SwitchInitial({required super.switchValue});
}
