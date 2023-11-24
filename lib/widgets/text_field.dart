import 'package:flutter/material.dart';

Widget textField(String inputText) {
  return TextField(
    decoration: InputDecoration(
      border: const OutlineInputBorder(),
      label: Text(inputText),
    ),
  );
}

Widget textFieldObscured(String inputText) {
  return TextField(
    obscureText: true,
    decoration: InputDecoration(
      border: const OutlineInputBorder(),
      label: Text(inputText),
    ),
  );
}
