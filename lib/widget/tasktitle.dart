import 'package:bloc_apps/blocs/bloc_export.dart';
import 'package:bloc_apps/models/task.dart';
import 'package:flutter/material.dart';

class Tasktitle extends StatelessWidget {
  const Tasktitle({super.key, required this.task});

  final Task task;

  // void _removeOrDeleteTask(BuildContext ctx, Task task) {
  //   task.isDeleted
  //       ? ctx.read<TasksBloc>().add(DeleteTask(task: task))
  //       : ctx.read<TasksBloc>().add(RemoveTask(task: task));
  // }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  task.title,
                  style: TextStyle(
                    decoration: task.isDone ? TextDecoration.lineThrough : null,
                  ),
                ),
                Checkbox(
                  value: task.isDone,
                  //     //apply condition here for updating and task
                  onChanged: task.isDone == false
                      ? (value) {
                          context.read<TasksBloc>().add(UpdateTask(task: task));
                        }
                      : null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
    // ListTile(
    //   title: Text(
    //     task.title,
    //     style: TextStyle(
    //       decoration: task.isDone ? TextDecoration.lineThrough : null,
    //     ),
    //   ),
    //   trailing: Checkbox(
    //     value: task.isDone,
    //     //apply condition here for updating and task
    //     onChanged: task.isDone == false
    //         ? (value) {
    //             context.read<TasksBloc>().add(UpdateTask(task: task));
    //           }
    //         : null,
    //   ),
    //   // onLongPress: () => _removeOrDeleteTask(context, task),
    // );
  }
}
