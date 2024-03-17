class Task {
  final int? id;
  final String title;
  final String? description;
  final bool isCompleted;

  Task({
    required this.title,
    required this.isCompleted,
    this.id,
    this.description,
  });
}
