import 'package:equatable/equatable.dart';
import 'package:flutter_application_2/feature/todo/model/todo_model.dart';

class TodoState extends Equatable {
  final List<TodoModel> todoList;
  final DataState dataState;
  final int timeStamp;
  const TodoState(
      {this.dataState = DataState.initial,
      this.todoList = const [],
      this.timeStamp = 0});

  TodoState copyWith(
      {List<TodoModel>? todoList, DataState? dataState, int? timeStamp}) {
    return TodoState(
        todoList: todoList ?? this.todoList,
        dataState: dataState ?? this.dataState,
        timeStamp: timeStamp ?? this.timeStamp);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [todoList, dataState, timeStamp];
}

enum DataState { initial, loading, loaded, error }
