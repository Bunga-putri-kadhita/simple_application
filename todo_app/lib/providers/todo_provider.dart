import 'package:flutter/foundation.dart';
import '../models/todo.dart';

class TodoProvider extends ChangeNotifier {
  final List<Todo> _todos = [];

  List<Todo> get todos => _todos;

void addTodo(String title, String detail) {
    _todos.add(Todo(
      title: title,
      detail: detail,
    ));
    notifyListeners();
  }

  void toggleTodoStatus(int index) {
    _todos[index].isDone = !_todos[index].isDone;
    notifyListeners();
  }

  void removeTodo(int index) {
    _todos.removeAt(index);
    notifyListeners();
  }
}
