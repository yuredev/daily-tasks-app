import 'package:flutter/material.dart';

class TaskDetails extends StatelessWidget {
  final String title;
  final String description;
  final bool wasFinished;

  TaskDetails({
    @required this.title,
    @required this.wasFinished,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 20,
                  ),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).textScaleFactor * 20,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Status: ',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(wasFinished ? 'Finished ✔' : 'Remaning ❌'),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  'Description: ',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(description),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
