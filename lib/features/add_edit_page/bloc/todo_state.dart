part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

class TodoInitial extends TodoState {}

class TodoLoading extends TodoState {}

class TodoLoadSuccessful extends TodoState {
  final Todo todo;

  const TodoLoadSuccessful(this.todo);

  @override
  List<Object> get props => [todo];
}

class TodoFailed extends TodoState {}
class TodoSubmitSuccess extends TodoState{}
