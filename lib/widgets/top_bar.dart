import 'package:dice_and_tiles/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:dice_and_tiles/resources/icons.dart';
import 'package:dice_and_tiles/resources/text_styles.dart';

AppBar topBar(BuildContext context) {
  return AppBar(
    scrolledUnderElevation: 0,
    leading:
        IconButton(onPressed: () => print('Search screen'), icon: iconSearch),
    actions: [
      IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfileScreen()),
            );
          },
          icon: iconAccount)
    ],
    title: const Text(
      'Dice&Tiles',
      style: myFontHeadlineMedium,
      textAlign: TextAlign.center,
    ),
    centerTitle: true,
  );
}

AppBar topBarBack(String text, BuildContext context) {
  return AppBar(
    scrolledUnderElevation: 0,
    leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: iconBack),
    title: Text(
      text,
      style: myFontHeadlineMedium,
      textAlign: TextAlign.left,
    ),
  );
}

AppBar topBarRegister(BuildContext context) {
  return AppBar(
    scrolledUnderElevation: 0,
    title: const Text(
      'Rejestracja',
      style: myFontHeadlineMedium,
      textAlign: TextAlign.left,
    ),
  );
}
