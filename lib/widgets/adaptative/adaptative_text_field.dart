import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class AdaptativeTextField extends StatelessWidget {

  final String fieldName;
  final TextEditingController controller;
  final TextInputType textInputType;
  final void Function() onSubmit;
  final int maxLines;

  AdaptativeTextField({
    @required this.fieldName,
    @required this.controller,
    this.textInputType,
    this.onSubmit,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid ? TextField(
      controller: this.controller,
      keyboardType: this.textInputType,
      maxLines: this.maxLines,
      decoration: InputDecoration(
        hintText: this.fieldName,
      ),
    ) : CupertinoTextField(
      controller: this.controller,
      placeholder: this.fieldName,
      maxLines: this.maxLines,
      keyboardType: this.textInputType,
    );
  }
}