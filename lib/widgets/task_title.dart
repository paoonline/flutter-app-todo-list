import 'package:flutter/material.dart';

class TaskTitle extends StatelessWidget {
  final String title;
  final String? description;
  final bool isCompleted;
  final Function(bool?) onChanged;

  TaskTitle(
      {required this.title,
      required this.isCompleted,
      required this.onChanged,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(description!),
      leading: Checkbox(
        value: isCompleted,
        onChanged: onChanged,
      ),
    );
  }
}
