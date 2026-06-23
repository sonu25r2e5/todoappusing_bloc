import 'package:bloc_apps/blocs/bloc_export.dart';
import 'package:bloc_apps/models/task.dart';
import 'package:equatable/equatable.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends HydratedBloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
    on<AddTask>(
      //write logic here for adding tasks
      _onAddTask,
    );
    on<UpdateTask>(
      //write logic here for adding tasks
      _onUpadateTask,
    );
    on<DeleteTask>(
      //write logic here for adding tasks
      _ondeleteTask,
    );
  }

  void _onAddTask(AddTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(allTasks: List.from(state.allTasks)..add(event.task)));
  }

  void _onUpadateTask(UpdateTask event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;
    final int index = state.allTasks.indexOf(task);

    if (index < 0) return;

    final List<Task> allTasks = List.from(state.allTasks)
      ..removeAt(index)
      ..insert(index, task.copyWith(isDone: !task.isDone));

    emit(TasksState(allTasks: allTasks));
  }

  // for deleting the task
  void _ondeleteTask(DeleteTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(allTasks: List.from(state.allTasks)..remove(event.task)));
  }

  @override
  TasksState? fromJson(Map<String, dynamic> json) {
    // throw UnimplementedError();
    return TasksState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TasksState state) {
    // TODO: implement toJson
    // throw UnimplementedError();
    return state.toMap();
  }
}
