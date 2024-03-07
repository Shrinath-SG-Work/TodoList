import 'package:bloc/bloc.dart';
import 'package:flutter_application_2/feature/todo/bloc/bloc/todo_state.dart';
import 'package:flutter_application_2/feature/todo/model/todo_model.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';

part 'todo_event.dart';
// part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(const TodoState()) {
    on<GetTodos>((event, emit) async {
      try {
        var res = await fetchTodo();
        if (res.isNotEmpty) {
          emit(state.copyWith(dataState: DataState.loaded, todoList: res));
        }
      } catch (err) {
        print(err);
        emit(state.copyWith(dataState: DataState.error));
      }
    });

    on<ToggleFav>((event, emit) async {
      List<TodoModel> todoList = List.from(state.todoList);
      for (var i = 0; i < todoList.length; i++) {
        if (event.id == i) {
          print('object');
          todoList[i].completed = !todoList[i].completed;
        }
      }
      emit(state.copyWith(
          todoList: todoList,
          timeStamp: DateTime.now().millisecondsSinceEpoch));
    });
  }

  Future<List<TodoModel>> fetchTodo() async {
    try {
      Dio _dio = Dio();

      final res = await _dio.get('https://jsonplaceholder.typicode.com/todos');

      if (res.statusCode == 200) {
        return todoModelFromJson(res.data);
      }
    } catch (err) {
      rethrow;
    }
    return [];
  }
}
