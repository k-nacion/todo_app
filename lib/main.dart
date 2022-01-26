import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/app_route.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      debugShowCheckedModeBanner: false,
      theme: FlexThemeData.light(scheme: FlexScheme.sakura),
      onGenerateRoute: AppRoute.generateAppRoute,
      initialRoute: AppRoute.home,
    );
  }
}
