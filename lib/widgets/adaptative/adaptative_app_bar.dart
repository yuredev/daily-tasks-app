import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class AdaptativeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final List<Widget> actions;

  AdaptativeAppBar({
    this.title,
    this.actions,
  });

  @override
  PreferredSizeWidget build(BuildContext context) {
    final appPresentation = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Daily Tasks'),
        Text('by: yuredev'),
      ],
    );
    final PreferredSizeWidget appBar = Platform.isAndroid
        ? AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: appPresentation,
            actions: this.actions != null ? this.actions : [],
          )
        : CupertinoNavigationBar(
            middle: appPresentation,
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: this.actions != null ? this.actions : [],
            ),
          );

    return appBar;
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
