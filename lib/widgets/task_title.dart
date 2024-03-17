import 'package:flutter/material.dart';

class TaskTitle extends StatelessWidget {
  final String title;
  final String? description;
  final bool isCompleted;
  final Function()? onComplete;
  final Function()? onDelete;

  TaskTitle(
      {this.onComplete,
      required this.title,
      required this.isCompleted,
      this.onDelete,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(description!),
      tileColor: isCompleted ? Colors.green : null,
      leading: Row(
        mainAxisSize: MainAxisSize.min, // Ensure buttons take minimum space
        children: [
          Padding(
              padding: EdgeInsets.all(2.0),
              child: IconButton(
                onPressed: () {
                  !isCompleted && onComplete!();
                },
                icon: Icon(Icons.incomplete_circle),
              )),
          Padding(
              padding: EdgeInsets.all(2.0),
              child: IconButton(
                onPressed: () {
                  onDelete!();
                },
                icon: Icon(Icons.delete),
              )),
        ],
      ),
    );
  }
}
