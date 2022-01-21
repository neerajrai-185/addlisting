import 'package:flutter/material.dart';

InputDecoration buildInputDecoration(IconData icons, String lable) {
  return InputDecoration(
    // hintText: hinttext,
    //String hinttext,
    label: Text(lable),
    prefixIcon: Icon(icons),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide: BorderSide(color: Colors.green, width: 1.5),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide: BorderSide(color: Colors.blue, width: 1.5),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide: BorderSide(color: Colors.blue, width: 1.5),
    ),
  );
}
