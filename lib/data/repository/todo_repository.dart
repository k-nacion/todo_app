import 'dart:convert';

import 'package:todo_app/data/model/todo.dart';
import 'package:todo_app/data/services/todo_service.dart';

abstract class TodoRepository {
  Future<List<Todo>> getTodos();

  Future<void> saveTodo(Todo todo);
}

class TodoRepositoryImpl implements TodoRepository {
  final TodoService _service;

  const TodoRepositoryImpl(this._service);

  @override
  Future<List<Todo>> getTodos() async {
    final jsonString = await _service.getParsedJsonData();
    final todos = <Todo>[];
    for (final item in jsonString) {
      final todo = Todo.fromMap(item);
      todos.add(todo);
    }

    return todos;
  }

  @override
  Future<void> saveTodo(Todo todo) async {
    final encodedJson = json.encode(todo);
    _service.postRawData(encodedJson, {'content-type':'application/json'});

  }
}
