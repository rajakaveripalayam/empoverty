import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertView extends StatelessWidget {
  final String title;
  final String message;
  final String? positiveButtonTitle;
  final String? negativeButtonTitle;

  final VoidCallback? positiveButtonAction;
  final VoidCallback? negativeButtonAction;

  const AlertView({super.key, required this.title, required this.message, this.positiveButtonAction,  this.negativeButtonAction, this.positiveButtonTitle, this.negativeButtonTitle});

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      title:  Text(title),
      content:  Text(message),
      actions: [
        if (negativeButtonAction != null && negativeButtonTitle != null)
        TextButton(
          onPressed: () {
        context.router.pop();
        negativeButtonAction!();
          }, // Closes the alert
          child:  Text(negativeButtonTitle!),
        ),
        if (positiveButtonAction != null && positiveButtonTitle != null)
          TextButton(
          onPressed: () {
            context.router.pop();
            positiveButtonAction!();
          },
          child:  Text(positiveButtonTitle!),
        ),
      ],
    );
  }

}