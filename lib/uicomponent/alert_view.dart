import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertView extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback okAction;
  final VoidCallback cancelAction;

  const AlertView({super.key, required this.title, required this.message, required this.okAction, required this.cancelAction});

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      title:  Text(title),
      content:  Text(message),
      actions: [
        // The "Cancel" button
        TextButton(
          onPressed: () {
        context.router.pop();
          cancelAction();
          }, // Closes the alert
          child:  Text("Cancel"),
        ),
        // The "Confirm" button
        TextButton(
          onPressed: () {
            context.router.pop();
            okAction();
          },
          child:  Text("Ok"),
        ),
      ],
    );
  }

}