import 'package:flutter_test/flutter_test.dart';
import 'package:pe_prm/models/task.dart';

void main() {
  test('Task toMap va fromMap', () {
    final task = Task(id: 1, title: 'A', description: 'B', isDone: true);
    final task2 = Task.fromMap(task.toMap());
    expect(task2.title, 'A');
    expect(task2.isDone, true);
  });
}
