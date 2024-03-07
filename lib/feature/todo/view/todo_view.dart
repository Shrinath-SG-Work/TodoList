import 'package:flutter/material.dart';
import 'package:flutter_application_2/feature/todo/bloc/bloc/todo_bloc.dart';
import 'package:flutter_application_2/feature/todo/view/todo_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoBloc()..add(GetTodos()),
      child: const TodoPage(),
    );
  }
}
