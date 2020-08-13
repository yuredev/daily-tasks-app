import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class AdaptativeTextField extends StatelessWidget {

  final String fieldName;
  final TextEditingController controller;
  final TextInputType textInputType;
  final void Function() onSubmit;

  AdaptativeTextField({
    @required this.fieldName,
    @required this.controller,
    this.textInputType,
    this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid ? TextField(
      controller: this.controller,
      keyboardType: this.textInputType,
      decoration: InputDecoration(
        labelText: this.fieldName,
      ),
    ) : CupertinoTextField(
      controller: this.controller,
      placeholder: this.fieldName,
      keyboardType: this.textInputType,
    );
  }
}