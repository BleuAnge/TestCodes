part of 'todolist_bloc.dart';

@immutable
abstract class TodolistState {
  
}

abstract class TodolistActionState {

}

class TodolistInitial extends TodolistState {}

class TodolistSuccessState extends TodolistState {
  final List<ActivityModel> todolistItems;

  TodolistSuccessState({required this.todolistItems});
}
