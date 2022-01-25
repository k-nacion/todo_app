import 'package:flutter/material.dart';

import 'data/model/todo.dart';
import 'features/add_edit_page/add_edit_page.dart';
import 'features/homepage/homepage.dart';

class AppRoute {
  static const home = '/';
  static const add = '/add';
  static const edit = '/edit';

  static Route generateAppRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (context) => const Homepage(),);
      case add:
      case edit:
        {
          final Todo? todo = settings.arguments != null ? settings.arguments as Todo: null;

          return MaterialPageRoute(builder: (context) => AddEditPage(todo: todo),);
        }
      default: throw InvalidRouteException(settings.name);
    }
  }
}


class InvalidRouteException implements Exception{
  final String? route;

  const InvalidRouteException([this.route]);

  @override
  String toString() {
    return '[InvalidRouteException] : $route}';
  }
}