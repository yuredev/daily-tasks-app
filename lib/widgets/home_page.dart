import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? CupertinoPageScaffold(
      child: null
    ) : Scaffold(
      body: Container(),
      appBar: AppBar(
        title: Text('Daily Tasks'),
      ),
    );
  }
}