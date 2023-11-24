import 'package:flutter/material.dart';
import 'package:dice_and_tiles/resources/icons.dart';

Widget buttonFilled(String text) {
  return FilledButton(
    onPressed: () {},
    child: Text(text),
  );
}

Widget buttonOutlined(String text) {
  return OutlinedButton(
    onPressed: () {},
    child: Text(text),
  );
}

Widget buttonOutlinedWithIcon(bool state) {
  if (!state) {
    return OutlinedButton.icon(
      onPressed: () {},
      label: const Text('Dodaj do kolekcji'),
      icon: iconAdd,
    );
  }
  return OutlinedButton.icon(
    onPressed: null,
    label: const Text('W Twojej kolekcji'),
    icon: iconCheck,
  );
}

Widget buttonElevated(String text) {
  return ElevatedButton(
    onPressed: () {},
    child: Text(text),
  );
}

Widget buttonIcon(Widget icon) {
  return IconButton(onPressed: () {}, icon: icon);
}
