import 'package:bloc/bloc.dart';
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
    //update task
    final state = this.state;
    final task = event.task;
    //keeping the checkbox at same position so we need index for that.
    final int index = state.allTasks.indexOf(task);

    List<Task> allTasks = List.from(state.allTasks)..remove(task);
    task.isDone == false
        ? allTasks.insert(index, task.copyWith(isDone: true))
        : allTasks.insert(index, task.copyWith(isDone: false));

    // emit the the task
    emit(TasksState(allTasks: allTasks));
  }

  // for deleting the task
  void _ondeleteTask(DeleteTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(allTasks: List.from(state.allTasks)..remove(event.task)));
  }

  @override
  TasksState? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
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
