import 'dart:convert';

class Todo {
  String title;
  String detail;
  bool isDone;

  Todo({
    required this.title,
    required this.detail,
    this.isDone = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'detail': detail,
      'isDone': isDone,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      title: map['title'],
      detail: map['detail'],
      isDone: map['isDone'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());
  factory Todo.fromJson(String source) => Todo.fromMap(json.decode(source));
}
