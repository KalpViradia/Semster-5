import 'package:second/lab_12/3/utils/import_export.dart';

class Todo {
  final String? id;
  final String title;
  final bool isCompleted;

  Todo({
    this.id,
    required this.title,
    required this.isCompleted,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
    id: json[COL_ID],
    title: json[COL_TITLE],
    isCompleted: json[COL_ISCOMPLETED] ?? false,
  );

  Map<String, dynamic> toJson() => {
    COL_TITLE: title,
    COL_ISCOMPLETED: isCompleted,
  };
}
