import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  final int id;
  final String? title;
  final String? task;
  final bool isDone;

  const Todo({
    required this.id,
    this.title,
    this.task,
    required this.isDone,
  });

  @override
  List<Object?> get props => [id, title, task, isDone];

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'title': this.title,
      'task': this.task,
      'isDone': this.isDone,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'] as int,
      title: map['title'] as String,
      task: map['task'] as String,
      isDone: map['isDone'] as bool,
    );
  }

  Todo copyWith({
    int? id,
    String? title,
    String? task,
    bool? isDone,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      task: task ?? this.task,
      isDone: isDone ?? this.isDone,
    );
  }
}