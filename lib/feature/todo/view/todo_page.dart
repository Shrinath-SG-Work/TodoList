import 'package:flutter/material.dart';
import 'package:flutter_application_2/feature/todo/bloc/bloc/todo_bloc.dart';
import 'package:flutter_application_2/feature/todo/bloc/bloc/todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state.dataState == DataState.loaded) {
            return ListView.builder(itemBuilder: (context, index) {
              return ListTile(
                title: Text(state.todoList[index].title ?? ''),
                trailing: IconButton(
                    onPressed: () {
                      BlocProvider.of<TodoBloc>(context)
                          .add(ToggleFav(id: index));
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: state.todoList[index].completed
                          ? Colors.redAccent
                          : Colors.grey.shade200,
                    )),
              );
            });
          } else if (state.dataState == DataState.error) {
            return const Center(
              child: Text('something went wrong'),
            );
          }
          return Container();
        },
      ),
    );
  }
}
