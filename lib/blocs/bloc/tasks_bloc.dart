import 'package:bloc/bloc.dart';
import 'package:bloc_apps/models/task.dart';
import 'package:equatable/equatable.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
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

  void _onUpadateTask(UpdateTask event, Emitter<TasksState> emit) {}
  void _ondeleteTask(DeleteTask event, Emitter<TasksState> emit) {}
}
