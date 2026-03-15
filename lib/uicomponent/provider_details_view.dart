import 'package:em_poverty/uicomponent/title_and_details_display_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProviderDetailsView extends StatelessWidget {
  final String name;
  final String address;
  final String phoneNumber;
  final List<String> skills;

  const ProviderDetailsView({
    super.key,
    required this.name,
    required this.address,
    required this.phoneNumber,
  required this.skills
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TitleAndDetailsDisplayView(title: "Name: ", details: name),
      TitleAndDetailsDisplayView(title: "Address: ", details: address),
    Row(
    mainAxisAlignment: .center,
    children: [
    Text("Phone Number: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
    OutlinedButton(onPressed: () {

    }, child: Text(phoneNumber, style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15)),
    ),
     ],
    ),
      Row(
        mainAxisAlignment: .center,
        crossAxisAlignment: .start,
        children: [
          Text("Skills: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          Column(crossAxisAlignment: .center,
            children:
            skills.map((item) => Text(" $item ", style: TextStyle(fontSize: 15),)).toList()
          ,)],
      ),    ],);
  }

}