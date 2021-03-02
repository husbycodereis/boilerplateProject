// To parse this JSON data, do
//
//     final todos = todosFromJson(jsonString);

import 'dart:convert';

Todos todosFromJson(String str) => Todos.fromJson(json.decode(str));

String todosToJson(Todos data) => json.encode(data.toJson());

class Todos {
    Todos({
        this.userId,
        this.id,
        this.title,
        this.completed,
    });

    int userId;
    int id;
    String title;
    bool completed;

    factory Todos.fromJson(Map<String, dynamic> json) => Todos(
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
