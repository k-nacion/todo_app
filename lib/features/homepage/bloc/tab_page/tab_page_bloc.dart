import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tab_page_event.dart';
part 'tab_page_state.dart';

class TabPageBloc extends Bloc<TabPageEvent, TabPageState> {
  TabPageBloc() : super(TabPageInitial()) {
    on<TabPageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
