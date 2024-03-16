import 'package:flutter/material.dart';
import 'package:todo/screens/todo_screen.dart';
import 'package:provider/provider.dart';
import 'providers/task_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskProvider(),
      child: const MaterialApp(
        title: 'Flutter Provider Example',
        home: MyHomePage(title: 'Flutter todo demo'),
      ),
    );
  }
}
