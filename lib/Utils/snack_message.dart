import 'package:flutter/material.dart';
import 'package:rest_api_notepad/Styles/colors.dart';

void success({String? message, BuildContext? context}) {
  ScaffoldMessenger.of(context!).showSnackBar(
    SnackBar(
      content: Text(
        message!,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: primaryColor,
    ),
  );
}

void error({String? message, BuildContext? context}) {
  ScaffoldMessenger.of(context!).showSnackBar(
    SnackBar(
      content: Text(
        message!,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: primaryColor,
    ),
  );
}
