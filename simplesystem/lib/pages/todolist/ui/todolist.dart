import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simplesystem/pages/todolist/bloc/todolist_bloc.dart';
import 'package:simplesystem/pages/todolist/ui/components/todolist_tile.dart';

class MyTodoList extends StatefulWidget {
  const MyTodoList({super.key});

  @override
  State<MyTodoList> createState() => _MyTodoListState();
}

class _MyTodoListState extends State<MyTodoList> {
  final TodolistBloc _todolistBloc = TodolistBloc();

  @override
  void initState() {
    _todolistBloc.add(TodolistInitializedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 129, 96, 187),
        appBar: AppBar(
                  backgroundColor: Colors.deepPurpleAccent,
                  centerTitle: true,
                  title: Text('Todo List')
                  ),
        body: BlocConsumer<TodolistBloc,TodolistState>(
          bloc: _todolistBloc,
          listener: (context, state) {},
          listenWhen: (previous, current) => current is TodolistActionState,
          buildWhen:(previous, current) => current is !TodolistActionState,
          builder: (context, state) {
            switch (state.runtimeType) {
              case TodolistSuccessState:
                final successState = state as TodolistSuccessState;

                return ListView.builder(
                          itemCount: successState.todolistItems.length,
                          itemBuilder: (context, index) {
                            return TodolistTile(
                              todolistBloc: _todolistBloc,
                              activityModel: successState.todolistItems[index]
                            );
                        });
              default:
                return SizedBox();
            }
          },
        ));
  }
}
