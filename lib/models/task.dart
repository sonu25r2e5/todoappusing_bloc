// import 'dart:convert';  WE DON'T NEED THIS ONE
// ignore_for_file: public_member_api_docs, sort_constructors_first
// we use equatable and flutter bloc
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Task extends Equatable {
  final String title;
  final String description;
  final String id;
  final String date;
  bool? isDone;
  bool? isDeleted;
  bool? isFavorite;

  Task({
    required this.title,
    required this.description,
    required this.id,
    required this.date,
    this.isDone,
    this.isDeleted,
    this.isFavorite,
  }) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
    isFavorite = isFavorite ?? false;
  }

  Task copyWith({
    String? title,
    String? description,
    String? id,
    String? date,
    bool? isDone,
    bool? isDeleted,
    bool? isFavorite,
  }) {
    return Task(
      title: title ?? this.title,
      description: description ?? this.description,
      id: id ?? this.id,
      date: date ?? this.date,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'id': id,
      'date': date,
      'isDone': isDone,
      'isDeleted': isDeleted,
      'isFavorite': isFavorite,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] as String,
      description: map['description'] ?? '',
      id: map['id'] ?? '',
      date: map['date'] ?? '',
      isDone: map['isDone'] != null ? map['isDone'] as bool : false,
      isDeleted: map['isDeleted'] != null ? map['isDeleted'] as bool : false,
      isFavorite: map['isFavorite'] != null ? map['isFavorite'] as bool : false,
    );
  }

  @override
  List<Object?> get props => [
    title,
    description,
    id,
    date,
    isDone,
    isDeleted,
    isFavorite,
  ];

  // we don't use this one so no need to use dart:convert anymore
  // String toJson() => json.encode(toMap());

  // factory Task.fromJson(String source) =>
  //     Task.fromMap(json.decode(source) as Map<String, dynamic>);
}
