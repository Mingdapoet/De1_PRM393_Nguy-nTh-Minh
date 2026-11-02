import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/task.dart';
import '../viewmodels/color_viewmodel.dart';
import '../viewmodels/task_viewmodel.dart';
import 'task_edit_screen.dart';

class TaskListScreen extends ConsumerWidget {
  const TaskListScreen({super.key});

  IconData getIcon(String name) {
    switch (name) {
      case 'laptop':
        return Icons.laptop;
      case 'book':
        return Icons.menu_book;
      case 'slides':
        return Icons.co_present;
      case 'document':
        return Icons.description;
      default:
        return Icons.task;
    }
  }

  void showColorDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) {
        return Consumer(
          builder: (context, ref, child) {
            final selected = ref.watch(colorViewModelProvider);
            return AlertDialog(
              title: const Text('Chọn màu thanh ứng dụng'),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(appBarColors.length, (i) {
                  return GestureDetector(
                    onTap: () {
                      ref.read(colorViewModelProvider.notifier).changeColor(i);
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 22,
                          backgroundColor: appBarColors[i],
                          child: selected == i ? const Icon(Icons.check, color: Colors.white) : null,
                        ),
                        const SizedBox(height: 4),
                        Text(colorNames[i], style: const TextStyle(fontSize: 12)),
                      ],
                    ),
                  );
                }),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Đóng'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(taskViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý công việc'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(
            onPressed: () => showColorDialog(context, ref),
            icon: const Icon(Icons.palette),
          ),
        ],
      ),
      body: tasks.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Lỗi: $e')),
        data: (list) {
          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: list.length,
            itemBuilder: (context, index) {
              Task task = list[index];
              return Card(
                child: ListTile(
                  leading: Icon(getIcon(task.icon)),
                  title: Text(
                    task.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: task.isDone ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  subtitle: Row(
                    children: [
                      const Icon(Icons.event_note, size: 14),
                      const SizedBox(width: 4),
                      Expanded(child: Text(task.description)),
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TaskEditScreen(task: task)),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TaskEditScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
