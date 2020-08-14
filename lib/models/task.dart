import 'package:flutter/foundation.dart';

class Task {
  String title;
  bool wasFinished;
  String description;
  DateTime date;
  String id;

  Task({
    @required this.id,
    @required this.title,
    @required this.date,
    this.description,
    this.wasFinished = false,
  });
}
