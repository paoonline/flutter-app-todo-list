import 'package:flutter/material.dart';
import 'package:todo/main.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../providers/task_provider.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _TodoPageState();
}

class _TodoPageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final tasks = Provider.of<TaskProvider>(context).tasks;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:3',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: FloatingActionButton(
              onPressed: () {
                // First button action
                _incrementCounter();
              },
              tooltip: 'First Button',
              child: Icon(Icons.add),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32.0, right: 20),
            child: FloatingActionButton(
              onPressed: () {
                // Second button action
                print('Second button tapped');
              },
              tooltip: 'Second Button',
              child: Icon(Icons.delete),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
