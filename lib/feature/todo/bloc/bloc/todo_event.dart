part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}

class GetTodos extends TodoEvent {}

class ToggleFav extends TodoEvent {
  final int id;
  ToggleFav({required this.id});
}
