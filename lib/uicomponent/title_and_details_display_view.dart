import 'package:flutter/material.dart';

class TitleAndDetailsDisplayView extends StatelessWidget {
  final String title;
  final String details;

  const TitleAndDetailsDisplayView({
    super.key,
    required this.title,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start, // Aligns title to the top if details wrap
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          // 1. Wrap the text in Expanded to tell it to take only available space
          Expanded(
            child: Text(
              details,
              // 2. Allow it to wrap
              softWrap: true,
              // 3. Optional: Control the style
              style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}