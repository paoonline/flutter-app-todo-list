import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/task_provider.dart';
import 'package:todo/widgets/task_title.dart';

class TodoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final taskState = Provider.of<TaskProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Task List'),
        ),
        body: taskState.tasks.length == 0
            ? Padding(
                padding: EdgeInsets.all(16.0), child: Text('Date not found'))
            : ListView.builder(
                itemCount: taskState.tasks.length,
                itemBuilder: (ctx, index) {
                  final task = taskState.tasks[index];
                  return TaskTitle(
                    title: task.title,
                    description: task.description,
                    isCompleted: task.isCompleted,
                    onComplete: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Complete task'),
                            content: Text('are you sure for complete task?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  taskState.handleTaskComplete(index);
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                      //
                    },
                    onDelete: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Delete'),
                            content: Text('are you sure for delete?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  taskState.handleTaskDelete(task.id!);
                                  // Close the dialog when the button is pressed
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                      //
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
