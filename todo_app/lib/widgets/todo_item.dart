import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/todo_provider.dart';

class TodoItem extends StatelessWidget {
  final int index;
  const TodoItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final todo = context.watch<TodoProvider>().todos[index];

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        title: Text(
          todo.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Text(todo.detail),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.purple),
              onPressed: () {
                // TODO: Tambahin fitur edit
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                context.read<TodoProvider>().removeTodo(index);
              },
            ),
            IconButton(
              icon: Icon(
                todo.isDone ? Icons.check_circle : Icons.circle_outlined,
                color: Colors.green,
              ),
              onPressed: () {
                context.read<TodoProvider>().toggleTodoStatus(index);
              },
            ),
          ],
        ),
      ),
    );
  }
}
