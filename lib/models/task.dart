// import 'dart:convert';  WE DON'T NEED THIS ONE
// ignore_for_file: public_member_api_docs, sort_constructors_first
// we use equatable and flutter bloc
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Task extends Equatable {
  final String title;
  bool? isDone;
  bool? isDeleted;

  Task({required this.title, this.isDone, this.isDeleted}) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
  }

  // to copywith by by ctrl + dot.
  Task copyWith({String? title, bool? isDone, bool? isDeleted}) {
    return Task(
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'isDone': isDone,
      'isDeleted': isDeleted,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] as String,
      isDone: map['isDone'] != null ? map['isDone'] as bool : null,
      isDeleted: map['isDeleted'] != null ? map['isDeleted'] as bool : null,
    );
  }

  @override
  // insert here all class properities that are listed downl below nicely and clearly
  List<Object?> get props => [
    // list the properties here
    title, isDeleted, isDone,
  ];

  // we don't use this one so no need to use dart:convert anymore
  // String toJson() => json.encode(toMap());

  // factory Task.fromJson(String source) =>
  //     Task.fromMap(json.decode(source) as Map<String, dynamic>);
}
