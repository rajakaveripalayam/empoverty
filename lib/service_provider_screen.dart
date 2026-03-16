import 'package:auto_route/auto_route.dart';
import 'package:em_poverty/uicomponent/alert_view.dart';
import 'package:em_poverty/uicomponent/multiple_choice_view.dart';
import 'package:em_poverty/uicomponent/textfield_view.dart';
import 'package:flutter/material.dart';
@RoutePage()
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
    "Ac Worker"];
  final TextEditingController _nameFieldController = TextEditingController();
  final TextEditingController _phoneNumberFieldController = TextEditingController();


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
      appBar: AppBar(title: Text("Provider Enrollment Page")),
      body: SafeArea(child:
      Padding(
        padding: EdgeInsets.all(20),
      child:
      Column(
        mainAxisAlignment: .spaceEvenly,
        children: [
          MultipleChoiceView(
            allSkills: _allOptions,
            selectedSkills: _mySelectedSkills,
            onToggle: _handleSkillToggle,
          ),
          DisplayTextFieldWidget(
            inputController: _nameFieldController,
            placeHolder: "Please Enter Goal Name",
            title:  "Enter Goal Name",
          ),
          DisplayTextFieldWidget(
            inputController: _phoneNumberFieldController,
            placeHolder: "Please Enter Your Phone Number",
            title: "Enter Your Phone Number",
          ),
          Row(
            mainAxisAlignment: .spaceEvenly,
            children: [
            ElevatedButton(
              onPressed: () => print("Saving: $_mySelectedSkills"),
              child: const Text("Pick Location"),
            ),
            ElevatedButton(
              onPressed: () {
                print("Saving: $_mySelectedSkills");
                print(_nameFieldController.text);
                print(_phoneNumberFieldController.text);
                showDialog(
                  context: context,
                  builder: (context) => AlertView(
                    title: "Success",
                    message: "Your Details stored successfully",
                    okAction: () {
                      context.router.pop();
                    },
                    cancelAction: () {
                     },
                  ),
                );
              },
              child: const Text("Save"),
            )
          ],)

        ],
      ),
      )
      )


    );
  }
}