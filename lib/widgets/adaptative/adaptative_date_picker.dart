import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class AdaptativeDatePicker extends StatelessWidget {
  
  final String title;
  final void Function(DateTime) onDateChange; 

  AdaptativeDatePicker({
    this.title,
    this.onDateChange,
  });
  
  void _openAndroidCalendar(BuildContext context) async {
    DateTime selectedDate = await showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime.now(), 
      lastDate: DateTime(2021),
    );
    onDateChange(selectedDate != null ? selectedDate : DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid ? FlatButton(
      padding: const EdgeInsets.all(0),
      child: Text(this.title),
      onPressed: () => _openAndroidCalendar(context),
    ) : CupertinoDatePicker(
      initialDateTime: DateTime.now(),
      maximumDate: DateTime(2021),
      minimumDate: DateTime.now(),
      onDateTimeChanged: onDateChange,
    );
  }
}