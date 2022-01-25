import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/data/model/todo.dart';
import 'package:todo_app/data/repository/todo_repository.dart';

part 'list_event.dart';

part 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  final TodoRepository _repository;

  ListBloc(this._repository) : super(ListInitial()) {
    on<ListGot>((event, emit) {
      _mapListGotToState(event, emit);
    });
  }

  void _mapListGotToState(ListGot event, Emitter<ListState> emit) async {
    try {
      emit(ListLoading());

      final todos = await _repository.getTodos();
    } catch (e) {
      emit(ListLoadFailed());
      rethrow;
    }
  }
}
