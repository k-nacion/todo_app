import 'package:flutter/material.dart';
import 'package:todo_app/data/model/todo.dart';

class AddEditMain extends StatelessWidget {
  final Todo? todo;
  final TextEditingController titleController;
  final TextEditingController taskController;

  final globalKey = GlobalKey<FormState>();

  AddEditMain({
    Key? key,
    this.todo,
    required this.titleController,
    required this.taskController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 55),
      child: Form(
        key: globalKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 12.0, bottom: 4),
              child: Text(
                'Task Title',
                style: TextStyle(fontSize: 12),
              ),
            ),
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12, bottom: 4, top: 12),
              child: Text(
                'Description',
                style: TextStyle(fontSize: 12),
              ),
            ),
            TextFormField(
              controller: taskController,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            )
          ],
        ),
      ),
    );
  }
}
