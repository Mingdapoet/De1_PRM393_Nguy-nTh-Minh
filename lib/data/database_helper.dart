import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _db;

  static Future<Database> getDatabase() async {
    if (_db != null) return _db!;

    String path = join(await getDatabasesPath(), 'task.db');
    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE tasks(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            description TEXT,
            isDone INTEGER,
            icon TEXT
          )
        ''');

        // du lieu mau
        await db.insert('tasks', {'title': 'Làm bài tập Flutter', 'description': 'Hoàn thành trước thứ Sáu', 'isDone': 0, 'icon': 'laptop'});
        await db.insert('tasks', {'title': 'Ôn tập Riverpod', 'description': 'Xem lại bài giảng MVVM', 'isDone': 0, 'icon': 'book'});
        await db.insert('tasks', {'title': 'Chuẩn bị bài thuyết trình', 'description': 'Nhóm 4 - Chủ đề Firebase', 'isDone': 0, 'icon': 'slides'});
        await db.insert('tasks', {'title': 'Viết báo cáo môn học', 'description': 'Nộp trên LMS', 'isDone': 0, 'icon': 'document'});
      },
    );
    return _db!;
  }
}
