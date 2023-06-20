part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable{
  const HomeState();

  @override
  List<Object> get props => [];
}

abstract class HomeActionState extends HomeState{

}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadSuccessState extends HomeState {
  final List<ActivityModel> activities;

  HomeLoadSuccessState({
    required this.activities
  });
}

class HomeLoadErrorState extends HomeState {}

class NavigateToFavoriteState extends HomeActionState {}

class NavigateToTodoListState extends HomeActionState {}

class ItemAddedToFavoriteState extends HomeActionState {}

class ItemAddedToTodoListState extends HomeActionState {}