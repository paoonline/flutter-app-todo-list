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

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
        id: json['id'] as int,
        title: json['title'] as String,
        description: json['description'] as String,
        isCompleted: json['isCompleted'] as bool);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isCompleted': isCompleted
    };
  }
}
