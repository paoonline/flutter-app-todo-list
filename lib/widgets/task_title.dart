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
              child: !isCompleted
                  ? ElevatedButton(
                      onPressed: () {
                        !isCompleted && onComplete!();
                      },
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all<Size>(
                            Size(70, 20)), // Set the fixed size
                        // You can also customize other aspects of the button's appearance here, such as padding, background color, etc.
                      ),
                      child: Icon(Icons.incomplete_circle),
                    )
                  : IconButton(
                      onPressed: () {
                        !isCompleted && onComplete!();
                      },
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all<Size>(
                            Size(70, 20)), // Set the fixed size
                        // You can also customize other aspects of the button's appearance here, such as padding, background color, etc.
                      ),
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
