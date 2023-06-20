import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:simplesystem/pages/favorite/ui/favorite.dart';
import 'package:simplesystem/pages/home/ui/components/activity_tile.dart';
import 'package:simplesystem/pages/todolist/ui/todolist.dart';

import '../bloc/home_bloc.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final HomeBloc _homeBloc = HomeBloc();
  
  @override
  void initState() {
    _homeBloc.add(HomeIntializedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: _homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is !HomeActionState,
      listener: (context, state) {
        if(state is NavigateToFavoriteState) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyFavorites()));
        }

        if(state is NavigateToTodoListState) {
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => MyTodoList()));
        }

        if(state is ItemAddedToFavoriteState) {
          Fluttertoast.showToast(
            msg: 'Activity Added to Favorites',
            gravity: ToastGravity.BOTTOM,
          );
        }

        if(state is ItemAddedToTodoListState) {
          Fluttertoast.showToast(
            msg: 'Activity Added to Todo List',
            gravity: ToastGravity.BOTTOM,
          );
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(
              body: Center(
                child: LinearProgressIndicator(),
              ),
            );
          
          case HomeLoadSuccessState:
            final successState = state as HomeLoadSuccessState;
            return Scaffold(
              backgroundColor: Color.fromARGB(255, 129, 96, 187),
              appBar: AppBar(
                backgroundColor: Colors.deepPurpleAccent,
                centerTitle: true,
                title: Text('Bored App'),
                actions: [
                  IconButton(
                    onPressed: (){
                      _homeBloc.add(HeaderFavoriteButtonClickedEvent());
                    }, 
                    icon: Icon(Icons.star_border_outlined)
                  ),
                  IconButton(
                    onPressed: (){
                      _homeBloc.add(HeaderTodoListButtonClickedEvent());
                    }, 
                    icon: Icon(Icons.list_alt)
                  ),
                ],
              ),
              body: ListView.builder(
                itemCount: successState.activities.length,
                itemBuilder: (context, index) {
                  return ActivityTile(
                    homeBloc: _homeBloc,
                    activityModel: successState.activities[index]
                  );
              }),
            );

          case HomeLoadErrorState:
            return Scaffold(
              body: Center(
                child: const Text("Application Malfunctioned UwU"),
              ),
            );

          default:
            return SizedBox();
        }
      },
    );
  }
}
