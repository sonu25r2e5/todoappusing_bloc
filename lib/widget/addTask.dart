// ignore: file_names
// ignore: file_names
import 'package:bloc_apps/blocs/bloc_export.dart';
import 'package:bloc_apps/models/task.dart';
import 'package:bloc_apps/services/guid_gen.dart';
import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // it must be assign with textEditingCOntroller() understand that
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('Enter your task here', style: TextStyle(fontSize: 23)),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: TextField(
                autocorrect: true,
                textInputAction: TextInputAction.done,
                controller: titleController,
                decoration: InputDecoration(
                  label: Text('enter your text title'),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            TextField(
              autocorrect: true,
              textInputAction: TextInputAction.done,
              minLines: 3,
              maxLines: 5,
              controller: descriptionController,
              decoration: InputDecoration(
                label: Text('enter  Description'),
                border: OutlineInputBorder(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    var task = Task(
                      title: titleController.text,
                      description: descriptionController.text,
                      id: GUIDGen.generate(),
                      date: DateTime.now().toIso8601String(),
                    );
                    context.read<TasksBloc>().add(AddTask(task: task));

                    Navigator.pop(context);
                  },
                  child: Text('Add'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancel'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
