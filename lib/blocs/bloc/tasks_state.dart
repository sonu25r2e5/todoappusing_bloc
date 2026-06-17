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
}
