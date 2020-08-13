import 'package:flutter/material.dart';
import './adaptative/adaptative_text_field.dart';

class TasksForm extends StatefulWidget {
  @override
  _TasksFormState createState() => _TasksFormState();
}

class _TasksFormState extends State<TasksForm> {
  final taskTitle = TextEditingController();
  final taskDescription = TextEditingController();
  final _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        children: [
          AdaptativeTextField(),
        ],
      ),
    );
  }
}