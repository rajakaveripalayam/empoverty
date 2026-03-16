import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MultipleChoiceView extends StatelessWidget {
  final List<String> allSkills;
  final List<String> selectedSkills;
  final Function(String, bool) onToggle; // Tells parent WHICH skill and if it was selected

  const MultipleChoiceView({
    super.key,
    required this.allSkills,
    required this.selectedSkills,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: .start,
      children: [
        Text("Select Your Skills"),
    Wrap(
    spacing: 8.0,
    children: allSkills.map((skill) {
    return FilterChip(
    label: Text(skill),
    selected: selectedSkills.contains(skill),
    onSelected: (bool selected) {
    onToggle(skill, selected); // Just pass the event up
    },
    );
    }).toList(),
    )
      ],
    );

  }
}