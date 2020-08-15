import 'package:daily_tasks_app/models/task.dart';
import 'package:daily_tasks_app/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DaySelector extends StatelessWidget {
  final List<Task> allTasks;
  final void Function(DateTime) onDaySelect;

  DaySelector({
    @required this.allTasks,
    @required this.onDaySelect,
  });

  List<Map<String, Object>> get _daysList {
    return List.generate(20, (i) {
      DateTime currentDay = DateTime.now().add(Duration(days: i));
      var currentDayTasks = this
          .allTasks
          .where((t) => Utils.compareDates(t.date, currentDay))
          .toList();
      return {
        'day': currentDay,
        'tasks': currentDayTasks,
      };
    });
  }

  // int get _dailyTasksFinished  {
  //   return this._daysList.fold(0, (count, task) {
  //     if (task.) {

  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: _daysList.length,
      itemBuilder: (ctx, i) {
        var dayReport = _daysList[i];
        return FlatButton(
          padding: EdgeInsets.all(0),
          onPressed: () => this.onDaySelect(dayReport['day']),
          child: Container(
            padding: EdgeInsets.all(5),
            width: 100,
            // color: Color.fromRGBO(200, 200, 200, 0.4),
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0x15000000),
                width: 1.0,
              ),
              color: Color(0x44EBEBEB),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Utils.compareDates(dayReport['day'], DateTime.now())
                      ? 'Today'
                      : DateFormat('dd/MM/yy').format(dayReport['day']),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '0 Finished',
                      style: TextStyle(
                        color: Colors.green[400],
                      ),
                    ),
                    Text(
                      '0 Remaining',
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
