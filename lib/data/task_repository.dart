import '../models/task.dart';
import 'database_helper.dart';

class TaskRepository {
  Future<List<Task>> getTasks() async {
    final db = await DatabaseHelper.getDatabase();
    final data = await db.query('tasks');
    return data.map((e) => Task.fromMap(e)).toList();
  }

  Future<void> insertTask(Task task) async {
    final db = await DatabaseHelper.getDatabase();
    await db.insert('tasks', task.toMap());
  }

  Future<void> updateTask(Task task) async {
    final db = await DatabaseHelper.getDatabase();
    await db.update('tasks', task.toMap(), where: 'id = ?', whereArgs: [task.id]);
  }
}
