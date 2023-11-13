import 'package:flutter/material.dart';

const Color colorWhite = Color.fromRGBO(255, 255, 255, 1);
const Color colorAss = Color.fromRGBO(236, 239, 241, 1.0);
const Color colorGreen = Color.fromRGBO(11, 171, 62, 1.0);




InputDecoration inputStyle(label) {
  return InputDecoration(
    hintText: "Please Enter "+label,
    labelText: label,
  );
}