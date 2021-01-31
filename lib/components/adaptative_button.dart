import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  const AdaptativeButton({
    this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(label),
            onPressed: null,
            color: theme.primaryColor,
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
          )
        : RaisedButton(
            color: theme.primaryColor,
            textColor: theme.textTheme.button.color,
            child: Text(label),
            onPressed: onPressed,
          );
  }
}
