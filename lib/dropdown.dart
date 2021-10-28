import 'package:flutter/material.dart';

class DropDownDemo extends StatefulWidget {
  @override
  _DropDownDemoState createState() => _DropDownDemoState();
}

class _DropDownDemoState extends State<DropDownDemo> {
  String _chosenValue = "Male";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 40, right: 40),
      child: DropdownButton<String>(
        value: _chosenValue,
        //elevation: 5,
        style: TextStyle(color: Colors.black),

        items: <String>[
          'Male',
          'Female',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              textAlign: TextAlign.center,
              
            ),
          );
        }).toList(),
        hint: Text(
          "Please choose a langauage",
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
        ),
        onChanged: (String? value) {
          setState(() {
            if (value != null) {
              _chosenValue = value;
            }
          });
        },
      ),
    );
  }
}
