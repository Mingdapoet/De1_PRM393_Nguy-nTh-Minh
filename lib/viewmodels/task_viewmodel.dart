import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/task_repository.dart';
import '../models/task.dart';

part 'task_viewmodel.g.dart';

@riverpod
TaskRepository taskRepository(Ref ref) {
  return TaskRepository();
}

@riverpod
class TaskViewModel extends _$TaskViewModel {
  @override
  Future<List<Task>> build() async {
    return ref.read(taskRepositoryProvider).getTasks();
  }

  Future<void> addTask(Task task) async {
    await ref.read(taskRepositoryProvider).insertTask(task);
    ref.invalidateSelf();
  }

  Future<void> updateTask(Task task) async {
    await ref.read(taskRepositoryProvider).updateTask(task);
    ref.invalidateSelf();
  }
}
