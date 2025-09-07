import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/todo_provider.dart';
import '../widgets/todo_item.dart';
import 'add_todo_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final todos = context.watch<TodoProvider>().todos;
    final filteredTodos =
        _selectedIndex == 0 ? todos : todos.where((t) => t.isDone).toList();

    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      appBar: AppBar(
        title: const Text("MY TODO"),
        backgroundColor: Colors.purple.shade300,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.calendar_today),
          )
        ],
      ),
      body: filteredTodos.isEmpty
          ? const Center(child: Text("Belum ada todo"))
          : ListView.builder(
              itemCount: filteredTodos.length,
              itemBuilder: (context, index) {
                final actualIndex = todos.indexOf(filteredTodos[index]);
                return TodoItem(index: actualIndex);
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple.shade300,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddTodoScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (i) => setState(() => _selectedIndex = i),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "All",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check),
            label: "Completed",
          ),
        ],
      ),
    );
  }
}
