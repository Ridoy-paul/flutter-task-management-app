import 'package:flutter/material.dart';
import '../style.dart';

void showSnackMesage(BuildContext context, String message, [bool isError = false]) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: isError ? colorRed : colorGreen,
    ),
  );
}
