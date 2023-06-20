part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable{
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeIntializedEvent extends HomeEvent {}

class ItemFavoriteButtonClickedEvent extends HomeEvent {
  final ActivityModel activityModel;

  ItemFavoriteButtonClickedEvent({required this.activityModel});
}

class ItemTodoListButtonClickedEvent extends HomeEvent {
  final ActivityModel activityModel;

  ItemTodoListButtonClickedEvent({required this.activityModel});
}

class HeaderFavoriteButtonClickedEvent extends HomeEvent {
  
}

class HeaderTodoListButtonClickedEvent extends HomeEvent {
  
}
