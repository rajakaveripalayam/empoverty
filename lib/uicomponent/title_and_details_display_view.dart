import 'package:flutter/cupertino.dart';

class TitleAndDetailsDisplayView extends StatelessWidget {
  final String title;
  final String details;

  const TitleAndDetailsDisplayView({ super.key, required this.title, required this.details});
  @override
  Widget build(BuildContext context) {
   return Row(
     mainAxisAlignment: .center,
     children: [
       Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
         Text(details, style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15)),
     ],
   );
  }

}