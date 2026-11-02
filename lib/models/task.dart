class Task {
  int? id;
  String title;
  String description;
  bool isDone;
  String icon;

  Task({
    this.id,
    required this.title,
    required this.description,
    this.isDone = false,
    this.icon = 'task',
  });

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      isDone: map['isDone'] == 1,
      icon: map['icon'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isDone': isDone ? 1 : 0,
      'icon': icon,
    };
  }
}
