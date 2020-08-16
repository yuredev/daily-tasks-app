import 'package:daily_tasks_app/widgets/adaptative/adaptative_app_bar.dart';
import 'package:daily_tasks_app/widgets/day_selector.dart';
import 'package:daily_tasks_app/widgets/tasks_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'dart:math';
import '../models/task.dart';
import 'day_tasks_list.dart';
import '../utils.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final List<Task> allTasks = [];

  DateTime _selectedDate = DateTime.now();

  void _setTaskFinishedStatus(Task task, bool isFinished) {
    setState(() => task.wasFinished = isFinished);
  }

  List<Task> get _tasksOfSelectedDate {
    return allTasks
        .where((task) => Utils.compareDates(task.date, _selectedDate))
        .toList();
  }

  void _addTask(String title, String description, DateTime date) {
    final newTask = Task(
      id: Random().nextDouble().toString(),
      date: date,
      title: title,
      description: description,
    );
    setState(() => this.allTasks.add(newTask));
    Navigator.of(context).pop();
  }

  void _setSelectedDate(DateTime newSelectedDay) {
    setState(() => this._selectedDate = newSelectedDay);
  }

  @override
  Widget build(BuildContext context) {
    final PreferredSizeWidget adaptativeAppBar = AdaptativeAppBar();
    final double totalAppHeight = MediaQuery.of(context).size.height;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double appBarHeight = adaptativeAppBar.preferredSize.height;
    final double avaliableHeight =
        totalAppHeight - statusBarHeight - appBarHeight;

    final bodyPage = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: avaliableHeight * 0.15,
              child: DaySelector(
                allTasks: this.allTasks,
                onDaySelect: this._setSelectedDate,
                selectedDate: this._selectedDate,
              ),
            ),
            Container(
              height: avaliableHeight * 0.85,
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: Column(
                children: [
                  if (this._tasksOfSelectedDate.isNotEmpty)
                    Text(
                      Utils.compareDates(this._selectedDate, DateTime.now())
                          ? 'Tasks of Today'
                          : 'Tasks of ${DateFormat('dd/MM/yy').format(this._selectedDate)}',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  Expanded(
                    child: DayTasksList(
                      dayTasks: this._tasksOfSelectedDate,
                      onTaskCheck: this._setTaskFinishedStatus,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    return Scaffold(
      appBar: const AdaptativeAppBar(),
      body: bodyPage,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => TasksForm(this._addTask),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
