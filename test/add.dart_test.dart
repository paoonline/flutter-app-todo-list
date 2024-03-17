import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/task.dart';
import 'package:todo/providers/task_provider.dart';
import 'package:todo/screens/add_screen.dart';

class MockTaskProvider extends Mock implements TaskProvider {}

void main() {
  testWidgets('Adding a task works correctly', (WidgetTester tester) async {
    // Create a mock task provider
    final mockTaskProvider = MockTaskProvider();

    // Build the AddTaskScreen widget with the mocked provider
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider.value(
          value: mockTaskProvider,
          child: AddTaskScreen(),
        ),
      ),
    );

    // Enter text in the title TextField
    await tester.enterText(find.byKey(Key('task_title')), 'Task 1');

    // Enter text in the description TextField
    await tester.enterText(
        find.byKey(Key('task_description')), 'Description 1');

    // Tap on the FloatingActionButton to add the task
    await tester.tap(find.byType(FloatingActionButton));

    // Wait for the task to be added (simulate the future completion)
    await tester.pump();

    // Verify that handleAddTask method is called with the correct task
    verify(mockTaskProvider.handleAddTask(
      Task(title: 'Task 1', isCompleted: false, description: 'Description 1'),
    )).called(1);

    // Verify that Navigator.pop() is called to close the screen
    expect(find.byType(AddTaskScreen), findsNothing);
  });
}
