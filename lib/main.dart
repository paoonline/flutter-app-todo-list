import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/task_provider.dart';
import 'package:todo/screens/add_screen.dart';
import 'package:todo/screens/todo_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TaskProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Provider Example',
        initialRoute: '/',
        routes: {
          '/': (context) => TodoScreen(),
          '/add-task': (context) => AddTaskScreen(),
        },
      ),
    );
  }
}
