import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import '../models/task.dart';

var logger = Logger();

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

  void handleAddTask(Task task) {
    Task prepareDate = Task(
        id: _tasks.length > 0 ? _tasks.length + 1 : 1,
        title: task.title,
        isCompleted: task.isCompleted,
        description: task.description);
    _tasks.add(prepareDate);

    notifyListeners();
  }

  void handleTaskComplete(int id) {
    Task updatedItem = Task(
      id: id,
      title: tasks[id].title,
      isCompleted: !tasks[id].isCompleted,
      description: tasks[id].description,
    );
    _tasks[id] = updatedItem;
    notifyListeners();
  }

  void handleTaskDelete(int id) {
    List<Task> filteredTask = tasks.where((item) => item.id != id).toList();
    _tasks = filteredTask;

    notifyListeners();
  }
}
