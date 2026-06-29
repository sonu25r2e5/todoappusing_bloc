// import 'dart:convert';  WE DON'T NEED THIS ONE
// ignore_for_file: public_member_api_docs, sort_constructors_first
// we use equatable and flutter bloc
import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String title;
  final String description;
  final String id;
  final bool isDone;
  final bool isDeleted;

  const Task({
    required this.title,
    bool? isDone,
    bool? isDeleted,
    required this.description,
    required this.id,
  }) : isDone = isDone ?? false,
       isDeleted = isDeleted ?? false;

  Task copyWith({
    String? title,
    String? description,
    String? id,
    bool? isDone,
    bool? isDeleted,
  }) {
    return Task(
      title: title ?? this.title,
      description: description ?? this.description,
      id: id ?? this.id,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'id': id,
      'isDone': isDone,
      'isDeleted': isDeleted,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] as String,
      description: map['description'] ?? '',
      id: map['id'] ?? '',
      isDone: map['isDone'] != null ? map['isDone'] as bool : false,
      isDeleted: map['isDeleted'] != null ? map['isDeleted'] as bool : false,
    );
  }

  @override
  List<Object?> get props => [title, isDeleted, isDone];

  // we don't use this one so no need to use dart:convert anymore
  // String toJson() => json.encode(toMap());

  // factory Task.fromJson(String source) =>
  //     Task.fromMap(json.decode(source) as Map<String, dynamic>);
}
