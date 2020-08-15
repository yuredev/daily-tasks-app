import 'package:daily_tasks_app/models/task.dart';
import 'package:daily_tasks_app/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DaySelector extends StatelessWidget {
  final List<Task> allTasks;
  final void Function(DateTime) onDaySelect;
  final DateTime selectedDate;

  DaySelector(
      {@required this.allTasks,
      @required this.onDaySelect,
      @required this.selectedDate});

  List<Map<String, Object>> get _daysList {
    return List.generate(15, (i) {
      DateTime currentDay = DateTime.now().add(Duration(days: i));
      var currentDayTasks = this._getTasksFromDay(currentDay);
      return {
        'day': currentDay,
        'tasks': currentDayTasks,
      };
    });
  }

  List<Task> _getTasksFromDay(DateTime day) {
    return this.allTasks.where((t) => Utils.compareDates(t.date, day)).toList();
  }

  int _getFinishedTasksCount(DateTime day) {
    var dayTasks = this._getTasksFromDay(day);

    int taskCount = dayTasks.fold(0, (count, task) {
      if (task.wasFinished) {
        return ++count;
      }
      return count;
    });
    return taskCount;
  }

  int _getRemaningTasksCount(DateTime day) {
    int totalDayTasks = this._getTasksFromDay(day).length;
    int finishedTasks = this._getFinishedTasksCount(day);
    return totalDayTasks - finishedTasks;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: _daysList.length,
      itemBuilder: (ctx, i) {
        var dayReport = _daysList[i];
        DateTime day = dayReport['day'];
        return FlatButton(
          padding: EdgeInsets.all(0),
          onPressed: () => this.onDaySelect(day),
          child: Container(
            padding: EdgeInsets.all(5),
            width: 100,
            // color: Color.fromRGBO(200, 200, 200, 0.4),
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0x15000000),
                width: 1.0,
              ),
              color: Utils.compareDates(day, this.selectedDate)
                  ? Color(0x449575CD)
                  : Color(0x119575CD),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Utils.compareDates(day, DateTime.now())
                      ? 'Today'
                      : DateFormat('dd/MM/yy').format(day),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${this._getFinishedTasksCount(day)} Finished',
                      style: TextStyle(
                        color: Colors.green[400],
                      ),
                    ),
                    Text(
                      '${this._getRemaningTasksCount(day)} Remaining',
                      style: TextStyle(
                        color: Colors.red[300],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
