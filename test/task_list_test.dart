import 'package:bloc_apps/models/task.dart';
import 'package:bloc_apps/widget/tasks_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('TaskList builds with duplicate task ids', (tester) async {
    final tasks = [
      Task(title: 'One', description: 'First', id: 'same-id'),
      Task(title: 'Two', description: 'Second', id: 'same-id'),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: TaskList(taskslist: tasks)),
      ),
    );

    expect(tester.takeException(), isNull);
  });
}
