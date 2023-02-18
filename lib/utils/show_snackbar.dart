import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text, [int? duration]) {
  if (duration == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        duration: Duration(seconds: duration),
      ),
    );
  }
}
