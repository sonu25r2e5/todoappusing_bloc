// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  // create a tasklist here . understand that.
  final List<Task> allTasks;

  const TasksState({this.allTasks = const <Task>[]});

  @override
  List<Object> get props => [
    // insert the list here
    allTasks,
  ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'allTasks': allTasks.map((x) => x.toMap()).toList(),
    };
  }

  factory TasksState.fromMap(Map<String, dynamic> map) {
    return TasksState(
      allTasks: map['allTasks'] != null
          ? List<Task>.from(
              (map['allTasks'] as List<dynamic>).map<Task>(
                (x) => Task.fromMap(x as Map<String, dynamic>),
              ),
            )
          : <Task>[],
    );
  }
}
