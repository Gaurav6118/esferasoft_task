import 'package:task/database/db_helper.dart';
import 'package:task/model/task_model.dart';

// This Class is used for Daily Time entries Database Operations
class DBTask {
  Future<int> insertTask(Task task) async {
    var dbClient = await DBHelper().database;
    var map = task.toJson();
    var result = await dbClient.insert('tasks', map);
    return result;
  }

  Future<List<Task>> getTasks() async {
    var dbClient = await DBHelper().database;
    var result = await dbClient.query('tasks');
    return result.map((task) => Task.fromJson(task)).toList();
  }

  Future<int> updateTask(Task task) async {
    var dbClient = await DBHelper().database;
    return await dbClient
        .update('tasks', task.toJson(), where: 'id = ?', whereArgs: [task.id]);
  }
}
