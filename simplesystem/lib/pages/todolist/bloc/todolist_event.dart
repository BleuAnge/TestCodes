part of 'todolist_bloc.dart';

@immutable
abstract class TodolistEvent {
  const TodolistEvent();

}

class TodolistInitializedEvent extends TodolistEvent {
  
}

class RemoveFromTodolistEvent extends TodolistEvent {
  final String itemkey;

  RemoveFromTodolistEvent({required this.itemkey});
}
