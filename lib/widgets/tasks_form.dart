import 'package:daily_tasks_app/widgets/adaptative/adaptative_date_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './adaptative/adaptative_text_field.dart';

class TasksForm extends StatefulWidget {

  final void Function(String title, String description, DateTime date) onSubmit;

  TasksForm(this.onSubmit);

  @override
  _TasksFormState createState() => _TasksFormState();
}

class _TasksFormState extends State<TasksForm> {
  final taskTitle = TextEditingController();
  final taskDescription = TextEditingController();
  DateTime _date = DateTime.now();

  void _submitTask() {
    String title = taskTitle.text;
    String decription = taskDescription.text;

    widget.onSubmit(title, decription, _date);
  }

  void _setSelectedDate(DateTime date) {
    setState(() => this._date = date);
    // print(_date);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            // keyboard space + 10
            bottom: 20 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              AdaptativeTextField(
                fieldName: 'Title',
                controller: this.taskTitle,
                textInputType: TextInputType.text,
              ),
              AdaptativeTextField(
                fieldName: 'Description',
                controller: this.taskDescription,
                textInputType: TextInputType.text,
                maxLines: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Selected Date: ${DateFormat('dd/MM/yy').format(this._date)}',
                  ),
                  AdaptativeDatePicker(
                    title: 'Select Date',
                    onDateChange: _setSelectedDate,
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: RaisedButton(
                      textColor: Theme.of(context).textTheme.button.color,
                      child: Text('Create New Task'),
                      onPressed: _submitTask,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
