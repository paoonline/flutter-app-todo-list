import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import '../models/task.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

var logger = Logger();
var uuid = Uuid();

class ITaskProvider {
  final int id;

  ITaskProvider({
    required this.id,
  });
}

class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks {
    return [..._tasks];
  }

  // Constructor
  TaskProvider() {
    _loadList();
  }

  Future<void> _loadList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? jsonStringList = prefs.getStringList('tasks');
    if (jsonStringList != null) {
      _tasks = jsonStringList
          .map((jsonString) => Task.fromJson(json.decode(jsonString)))
          .toList();
    }
    notifyListeners();
  }

  Future<void> handleSetLocalData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> jsonStringList =
        _tasks.map((task) => json.encode(task.toJson())).toList();
    prefs.setStringList('tasks', jsonStringList);
    notifyListeners();
  }

  Future<void> handleAddTask(Task task) async {
    String id = uuid.v4();
    Task prepareDate = Task(
        id: id,
        title: task.title,
        isCompleted: false,
        description: task.description);
    _tasks.add(prepareDate);
    handleSetLocalData();
    notifyListeners();
  }

  void handleTaskComplete(int id) {
    Task updatedItem = Task(
      id: tasks[id].id,
      title: tasks[id].title,
      isCompleted: !tasks[id].isCompleted,
      description: tasks[id].description,
    );
    _tasks[id] = updatedItem;
    handleSetLocalData();
    notifyListeners();
  }

  void handleTaskDelete(String id) {
    List<Task> filteredTask = _tasks.where((item) => item.id != id).toList();
    _tasks = filteredTask;
    handleSetLocalData();
    notifyListeners();
  }
}
