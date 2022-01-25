import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todo_app/data/services/todo_service_exception.dart';

abstract class TodoService {
  static const authority = '10.0.2.2:3000'; //The base domain of the api
  static const unencodedPath = '/todos'; // path for the endpoint
  final baseUrl = Uri.http(authority, unencodedPath);

  Future<dynamic> getParsedJsonData();

  Future<bool> postRawData(
    String encodedJson,
    Map<String, String> header,
  );
}

class TodoServiceImpl extends TodoService {
  @override
  Future getParsedJsonData() async {
    final response = await http.get(baseUrl);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    }

    throw TodoServiceException('an error occurred ${response.toString()}');
  }

  @override
  Future<bool> postRawData(String encodedJson, Map<String, String> header) async {
    final response = await http.post(baseUrl, headers: header, body: encodedJson);

    if (response.statusCode == 201 ) {
      return true;
    }

    return false;
  }
}
