part of 'list_bloc.dart';

abstract class ListState extends Equatable {
  const ListState();

  @override
  List<Object> get props => [];
}

class ListInitial extends ListState {}

class ListLoading extends ListState {}

class ListLoadSuccessful extends ListState {
  final List<Todo> data;

  const ListLoadSuccessful(this.data);

  @override
  List<Object> get props => [data];
}

class ListLoadFailed extends ListState {}
