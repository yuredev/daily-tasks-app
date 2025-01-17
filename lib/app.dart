import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './widgets/home_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        textTheme: ThemeData.light().textTheme.copyWith(
          button: TextStyle(
            color: Colors.white,
          ),
        ),
        buttonColor: Colors.deepPurple,
      ),
    );
  }
}