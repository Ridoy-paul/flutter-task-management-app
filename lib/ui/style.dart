import 'package:flutter/material.dart';

const Color colorWhite = Color.fromRGBO(255, 255, 255, 1);
const Color colorAss = Color.fromRGBO(236, 239, 241, 1.0);
const Color colorGray = Color.fromRGBO(109, 117, 119, 1.0);
const Color colorGreen = Color.fromRGBO(33, 191, 115, 1.0);
const Color colorBlue = Color.fromRGBO(83, 109, 254, 1.0);



InputDecoration inputStyle(label) {
  return InputDecoration(
    hintText: "Please Enter "+label,
    labelText: label,
  );
}