import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:simplesystem/mock_database/favorite.dart';
import 'package:simplesystem/mock_database/todolist.dart';

import '../../../api/get_activity.dart';
import '../models/activities_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeIntializedEvent>(homeIntializedEvent);
    on<ItemFavoriteButtonClickedEvent>(itemFavoriteButtonClickedEvent);
    on<ItemTodoListButtonClickedEvent>(itemTodoListButtonClickedEvent);
    on<HeaderFavoriteButtonClickedEvent>(headerFavoriteButtonClickedEvent);
    on<HeaderTodoListButtonClickedEvent>(headerTodoListButtonClickedEvent);
  }

  FutureOr<void> itemFavoriteButtonClickedEvent(
    ItemFavoriteButtonClickedEvent event, 
    Emitter<HomeState> emit) {
      favoriteItems.add(event.activityModel);
      emit(ItemAddedToFavoriteState());
  }

  FutureOr<void> itemTodoListButtonClickedEvent(
    ItemTodoListButtonClickedEvent event, 
    Emitter<HomeState> emit) { 
      todolistItems.add(event.activityModel);
      emit(ItemAddedToTodoListState());
  }

  FutureOr<void> headerFavoriteButtonClickedEvent(
    HeaderFavoriteButtonClickedEvent event, 
    Emitter<HomeState> emit) {
      emit(NavigateToFavoriteState());
  }

  FutureOr<void> headerTodoListButtonClickedEvent(
    HeaderTodoListButtonClickedEvent event, 
    Emitter<HomeState> emit) {
      emit(NavigateToTodoListState());
  }
}
