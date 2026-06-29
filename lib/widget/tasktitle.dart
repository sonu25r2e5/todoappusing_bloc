import 'package:bloc_apps/blocs/bloc_export.dart';
import 'package:bloc_apps/models/task.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Tasktitle extends StatelessWidget {
  const Tasktitle({super.key, required this.task});

  final Task task;

  void _removeOrDeleteTask(BuildContext ctx, Task task) {
    task.isDeleted
        ? ctx.read<TasksBloc>().add(DeleteTask(task: task))
        : ctx.read<TasksBloc>().add(RemoveTask(task: task));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => _removeOrDeleteTask(context, task),

      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Icons
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // crossAxisAlignment: CrossAxisAlignment.,
                      children: [
                        Icon(Icons.star_outline),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                task.title,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  decoration: task.isDone
                                      ? TextDecoration.lineThrough
                                      : null,
                                ),
                              ),
                              Text(
                                // other methods to use this
                                // DateFormat('dd-MM-yyyy h:').format(DateTime.now())
                                DateFormat().add_yMMMEd().add_Hm().format(
                                  DateTime.now(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Checkbox(
                    value: task.isDone,
                    //     //apply condition here for updating and task
                    onChanged: task.isDone == false
                        ? (value) {
                            context.read<TasksBloc>().add(
                              UpdateTask(task: task),
                            );
                          }
                        : null,
                  ),
                  // Popup menu bottom is listed here.
                  PopupMenuButton(
                    itemBuilder: ((context) => [
                      PopupMenuItem(
                        child: TextButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.edit),
                          label: Text('Edit'),
                        ),
                      ),
                      PopupMenuItem(
                        child: TextButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.bookmark),
                          label: Text('Added to Bookmarks'),
                        ),
                      ),
                      PopupMenuItem(
                        child: TextButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.delete),
                          label: Text('Delete'),
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ],
        ),
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
