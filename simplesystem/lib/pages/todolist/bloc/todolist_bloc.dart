import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:simplesystem/mock_database/todolist.dart';

import '../../home/models/activities_model.dart';

part 'todolist_event.dart';
part 'todolist_state.dart';

class TodolistBloc extends Bloc<TodolistEvent, TodolistState> {
  TodolistBloc() : super(TodolistInitial()) {
    on<TodolistInitializedEvent>(todolistInitializedEvent);
    on<RemoveFromTodolistEvent>(removeFromTodolistEvent);
  }

  FutureOr<void> todolistInitializedEvent(
    TodolistInitializedEvent event, 
    Emitter<TodolistState> emit) {
      emit(TodolistSuccessState(todolistItems: todolistItems));
  }

  FutureOr<void> removeFromTodolistEvent(
    RemoveFromTodolistEvent event, 
    Emitter<TodolistState> emit) {
      todolistItems.remove(event.itemkey);

      emit(TodolistSuccessState(todolistItems: todolistItems));
  }
}
