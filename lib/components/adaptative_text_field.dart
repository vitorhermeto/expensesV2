import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptativeTextField extends StatelessWidget {
  final TextInputType keyboardType;
  final TextEditingController controller;
  final Function onSubmitted;
  final String labelText;

  const AdaptativeTextField({
    this.keyboardType,
    this.controller,
    this.onSubmitted,
    this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
            ),
            child: CupertinoTextField(
              keyboardType: keyboardType,
              controller: controller,
              onSubmitted: onSubmitted,
              placeholder: labelText,
              padding: EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 12,
              ),
            ),
          )
        : TextField(
            keyboardType: keyboardType,
            controller: controller,
            onSubmitted: onSubmitted,
            decoration: InputDecoration(
              labelText: labelText,
            ),
          );
  }
}
