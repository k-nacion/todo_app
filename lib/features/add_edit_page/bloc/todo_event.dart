part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class TodoFetchedEvent extends TodoEvent {
}

class TodoSubmitEvent extends TodoEvent {
  final Todo todo;

  const TodoSubmitEvent(this.todo);

  @override
  List<Object> get props => [todo];
}