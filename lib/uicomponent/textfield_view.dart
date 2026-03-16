import 'package:flutter/material.dart';

class DisplayTextFieldWidget extends StatelessWidget {
  final TextEditingController inputController;
  final String title;
  final String placeHolder;
  final int maxLength;
  final TextInputType inputType;
  const DisplayTextFieldWidget({
    required this.inputController,
    required this.placeHolder,
    required this.title,
    this.maxLength = 20,
    this.inputType = TextInputType.text,
    super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: .start,
        children: [
      Text(title),
      TextFormField(
      controller: inputController,
      keyboardType: inputType,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
                width: 2,
                color: Colors.grey
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 2,
                color: Colors.green
            ),
          ),
          hintText: placeHolder,
          hintStyle: TextStyle(
              color: Colors.grey
          ),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 2,
                  color: Colors.red
              )
          )
      ),
      validator: (String? input){
        if(input != null && input.isNotEmpty){
          return null;
        }
        else{
          return "Enter valid inputs";
        }
      },
    )
    ]);


  }
}
