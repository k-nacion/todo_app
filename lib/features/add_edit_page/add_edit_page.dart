import 'package:flutter/material.dart';
import 'package:todo_app/data/model/todo.dart';

import 'add_edit_main.dart';

class AddEditPage extends StatefulWidget {
  const AddEditPage({Key? key, this.todo}) : super(key: key);

  final Todo? todo;

  @override
  State<AddEditPage> createState() => _AddEditPageState();
}

class _AddEditPageState extends State<AddEditPage> {
  final titleController = TextEditingController();
  final taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _generateAppBar(context),
      floatingActionButton: _generateFloatingActionButton(context),
      body: AddEditMain(
        todo: widget.todo,
        taskController: taskController,
        titleController: titleController,
      ),
    );
  }

  AppBar _generateAppBar(BuildContext context) => AppBar(
        title: Text(widget.todo != null ? 'Edit' : 'Add'),
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () => Navigator.pop(context),
        ),
      );

  Widget _generateFloatingActionButton(BuildContext context) =>
      FloatingActionButton(
        onPressed: () {
          /*TODO: Implement [AddEditPage] floating action button*/
        },
        child: const Icon(Icons.check),
        heroTag: null,
      );
}
