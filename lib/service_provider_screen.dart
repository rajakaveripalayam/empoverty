import 'package:auto_route/auto_route.dart';
import 'package:em_poverty/uicomponent/multiple_choice_view.dart';
import 'package:flutter/material.dart';

class ServiceProviderScreen extends StatefulWidget {
  const ServiceProviderScreen({super.key});

  @override
  State<ServiceProviderScreen> createState() => _ServiceProviderScreenState();
}

class _ServiceProviderScreenState extends State<ServiceProviderScreen> {
  final List<String> _allOptions = [
    "Plumber",
    "Painter",
    "Electrician",
    "Carpenter",
    "Cleaning Worker",
  "Ac Worker"];

  // THE SINGLE SOURCE OF TRUTH
  List<String> _mySelectedSkills = [];

  void _handleSkillToggle(String skill, bool isSelected) {
    setState(() {
      if (isSelected) {
        _mySelectedSkills.add(skill);
      } else {
        _mySelectedSkills.remove(skill);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:
      Column(
        children: [
          MultipleChoiceView(
            allSkills: _allOptions,
            selectedSkills: _mySelectedSkills, // Pass data DOWN
            onToggle: _handleSkillToggle,      // Pass event UP
          ),
          ElevatedButton(
            onPressed: () => print("Saving: $_mySelectedSkills"),
            child: const Text("Save"),
          )
        ],
      ),
      )


    );
  }
}