import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/task_provider.dart';
import 'package:todo/widgets/task_title.dart';

var logger = Logger();

class TodoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final taskState = Provider.of<TaskProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Todo List'),
        ),
        body: ListView.builder(
          itemCount: taskState.tasks.length,
          itemBuilder: (ctx, index) {
            final task = taskState.tasks[index];
            return TaskTitle(
              title: task.title,
              description: task.description,
              isCompleted: task.isCompleted,
              onChanged: (value) {
                logger.d(index);
                taskState.handleTaskDelete(index + 1);
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/add-task');
          },
          child: Icon(Icons.add),
        ));
  }
}
