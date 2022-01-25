import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/app_route.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _generateAppBar(context),
      bottomNavigationBar: _generateBottomAppBar(context),
      floatingActionButton: _generateFloatingActionButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  AppBar _generateAppBar([BuildContext? context]) => AppBar(
        title: const Text('Todos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              /*TODO: create FilterList onPressed Event*/
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {} /*TODO: create MoreVert onPressed Event*/,
          ),
        ],
      );

  Widget _generateFloatingActionButton([BuildContext? context]) => FloatingActionButton(
        heroTag: null,
        onPressed: () async {
          final shouldRefresh = await Navigator.pushNamed(context!, AppRoute.add);
        },
        child: const Icon(Icons.add),
      );

  Widget _generateBottomAppBar([BuildContext? context]) => BottomAppBar(
        clipBehavior: Clip.hardEdge,
        color: Theme.of(context!).primaryColor,
        shape: const CircularNotchedRectangle(),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.list),label: 'Todos'),
            BottomNavigationBarItem(icon: Icon(Icons.show_chart), label: 'stats'),
          ],
        ),
      );
}
