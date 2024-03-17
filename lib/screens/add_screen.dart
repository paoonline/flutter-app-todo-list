import 'dart:math';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/task.dart';

import 'package:todo/providers/task_provider.dart';

var logger = Logger();

class AddTaskScreen extends StatelessWidget {
  final TextEditingController _taskTitleController = TextEditingController();

  final TextEditingController _taskDescriptionController =
      TextEditingController();

  void _addTask(BuildContext context) {
    final taskText = _taskTitleController.text;
    final taskDescription = _taskDescriptionController.text;
    if (taskText.isNotEmpty) {
      Provider.of<TaskProvider>(context, listen: false).handleAddTask(
        Task(title: taskText, isCompleted: false, description: taskDescription),
      );
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    // final taskState = Provider.of<TaskProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Task'),
        ),
        body: Padding(
          padding:
              EdgeInsets.all(16.0), // Add padding of 16.0 pixels to all sides
          child: Column(
            children: [
              TextField(
                  controller: _taskTitleController,
                  decoration: InputDecoration(labelText: 'Title'),
                  onChanged: (value) {}),
              TextField(
                  controller: _taskDescriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                  onChanged: (value) {})
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _addTask(context);
          },
          child: Icon(Icons.add),
        ));
  }
}
