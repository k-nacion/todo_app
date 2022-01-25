import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/data/model/todo.dart';
import 'package:todo_app/data/repository/todo_repository.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository _todoRepository;

  TodoBloc(this._todoRepository) : super(TodoInitial()) {
    on<TodoFetchedEvent>((event, emit) => _mapTodoFetchedEventToState(event, emit));
    on<TodoSubmitEvent>((event, emit) => _mapTodoSubmitEventToState(event, emit));
  }

  void _mapTodoFetchedEventToState(TodoFetchedEvent event, Emitter<TodoState> emit) async {
    emit(TodoLoading());


  }

  void _mapTodoSubmitEventToState(TodoSubmitEvent event, Emitter<TodoState> emit) async {
    emit(TodoLoading());

    await _todoRepository.saveTodo(event.todo);

    emit(TodoSubmitSuccess());

  }

}
