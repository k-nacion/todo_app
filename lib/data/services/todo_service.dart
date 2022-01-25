import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todo_app/data/model/todo.dart';
import 'package:todo_app/data/services/todo_service_exception.dart';

abstract class TodoService {
  static const authority = '10.0.2.2:3000'; //The base domain of the api
  static const unencodedPath = '/todos'; // path for the endpoint
  final baseUrl = Uri.http(authority, unencodedPath);

  ///Returns a [List] if the data that json is an [Array].
  ///Returns a [Map]<[String], [dyanmic]> if the json data is an [Object]
  Future<dynamic> getParsedJsonData();
  Future<bool> postRawData(String encodedJson);
  Future<dynamic> deleteData(Todo todo);
  Future<dynamic> updateData(Todo todo);
}

class TodoServiceImpl extends TodoService {
  final _header = {
    'content-type': 'application/json'
  };

  @override
  Future getParsedJsonData() async {
    final response = await http.get(baseUrl);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    }

    throw TodoServiceException('an error occurred ${response.toString()}');
  }

  @override
  Future<bool> postRawData(
      String encodedJson) async {
    final response =
        await http.post(baseUrl, headers: _header, body: encodedJson);

    if (response.statusCode == 201) {
      return true;
    }

    return false;
  }

  @override
  Future deleteData(Todo todo) async {
    final response = await http.delete(
        baseUrl.replace(path: TodoService.unencodedPath + '/${todo.id}'),
        headers: _header);
  }

  @override
  Future updateData(Todo todo) async {
    final response = await http.put(
        baseUrl.replace(path: TodoService.unencodedPath + '/${todo.id}'),
        headers: _header);
  }
}
