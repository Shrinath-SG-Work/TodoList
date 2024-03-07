// To parse this JSON data, do
//
//     final todoModel = todoModelFromJson(jsonString);

// import 'dart:convert';

List<TodoModel> todoModelFromJson(List<dynamic> data) =>
    List<TodoModel>.from(data.map((x) => TodoModel.fromJson(x)));

// String todoModelToJson(List<TodoModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TodoModel {
  final int? userId;
  final int? id;
  final String? title;
  bool completed;

  TodoModel({
    required this.userId,
    required this.id,
    required this.title,
    this.completed = false,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
      };
}
