import 'package:daily_tasks_app/models/task.dart';
import 'package:daily_tasks_app/widgets/day_task_widget.dart';
import 'package:flutter/material.dart';

import '../utils.dart';

class DayTasksList extends StatelessWidget {
  final List<Task> dayTasks;
  final void Function(Task, bool) onTaskCheck;

  DayTasksList({
    @required this.dayTasks,
    @required this.onTaskCheck,
  });

  @override
  Widget build(BuildContext context) {
    if (this.dayTasks.isNotEmpty) {
      return ListView.builder(
        itemCount: this.dayTasks.length,
        itemBuilder: (ctx, index) => DayTaskWidget(
          task: this.dayTasks[index],
          onTaskCheck: onTaskCheck,
        ),
      );
    } else {
      return Container(
        child: Column(
          children: [
            Utils.isPortrait(context) ? const Icon(
              Icons.airline_seat_individual_suite,
              size: 250,
              color: Color(0x11000000),
            ) : Container(),
            Text(
              'No Tasks in this Day',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: MediaQuery.of(context).textScaleFactor * 20,
              ),
            ),
          ],
        ),
      );
    }
  }
}
