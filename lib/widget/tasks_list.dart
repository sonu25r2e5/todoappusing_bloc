import 'package:bloc_apps/models/task.dart';
import 'package:bloc_apps/widget/tasktitle.dart';
import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key, required this.taskslist});

  final List<Task> taskslist;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          children: taskslist.asMap().entries.map((entry) {
            final index = entry.key;
            final task = entry.value;

            return ExpansionPanelRadio(
              value: '${task.id}-$index',
              headerBuilder: (context, isOpen) => Tasktitle(task: task),
              body: ListTile(
                title: SelectableText.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Text: \n',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: task.title),
                      TextSpan(
                        text: '\n\nDescription: \n ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: task.description),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

// Expanded(
//       child: ListView.builder(
//         itemCount: widget.taskslist.length,
//         itemBuilder: (context, index) {
//           var task = widget.taskslist[index];
//           return Tasktitle(task: task);
//         },
//       ),
//     // );
