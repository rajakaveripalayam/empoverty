import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  const ButtonComponent({super.key, required this.title, required this.onPress});

  @override
  Widget build(BuildContext context) {
   return FilledButton(
       style: FilledButton.styleFrom(
         backgroundColor: Colors.green, // button background color
         foregroundColor: Colors.white, // text/icon color
       ),
      onPressed: () {
         onPress();
      },
      child: Text(title),
    );
  }
}