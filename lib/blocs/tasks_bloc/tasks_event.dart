part of 'tasks_bloc.dart';

abstract class TasksEvent extends Equatable {
  const TasksEvent();

  @override
  List<Object> get props => [];
}

// we have three event s

class AddTask extends TasksEvent {
  final Task task;
  const AddTask({required this.task});
  // for adding the task

  @override
  List<Object> get props => [task];
}

//update task
class UpdateTask extends TasksEvent {
  final Task task;
  const UpdateTask({required this.task});

  @override
  List<Object> get props => [task];
}

//Delete Task
class DeleteTask extends TasksEvent {
  final Task task;
  const DeleteTask({required this.task});

  @override
  List<Object> get props => [task];
}

//Delete Task
class RemoveTask extends TasksEvent {
  final Task task;
  const RemoveTask({required this.task});

  @override
  List<Object> get props => [task];
}

class ClearRemovedTasks extends TasksEvent {
  const ClearRemovedTasks();
}

class MarkFavoriteOrUnfavoriteTask extends TasksEvent {
  final Task task;
  const MarkFavoriteOrUnfavoriteTask({required this.task});
}
