import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/task.dart';
import 'package:todo/providers/task_provider.dart';

import 'package:todo/screens/todo_screen.dart';

class MockTaskProvider extends Mock implements TaskProvider {}

void main() {
  testWidgets('TodoScreen displays tasks', (WidgetTester tester) async {
    // Create a mock task provider
    final mockTaskProvider = MockTaskProvider();

    // Stub the tasks getter with some dummy tasks
    when(mockTaskProvider.tasks).thenReturn([
      Task(title: 'Task 1', description: 'Description 1', isCompleted: false),
      Task(title: 'Task 2', description: 'Description 2', isCompleted: true),
    ]);

    // Build the TodoScreen widget with the mocked provider
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ChangeNotifierProvider.value(
            value: mockTaskProvider,
            child: TodoScreen(),
          ),
        ),
      ),
    );

    // Verify that the task titles are displayed
    expect(find.text('Task 1'), findsOneWidget);
    expect(find.text('Task 2'), findsOneWidget);

    // Verify that the "No tasks found" message is not displayed
    expect(find.text('Date not found'), findsNothing);
  });
}
