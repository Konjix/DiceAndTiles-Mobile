import 'package:flutter/material.dart';
import 'package:dice_and_tiles/resources/text_styles.dart';
import 'package:dice_and_tiles/resources/icons.dart';

Widget dividerLarge(String title) {
  return Column(
    children: [
      const Divider(),
      Container(
        padding: const EdgeInsets.only(left: 20, top: 16, bottom: 20),
        child: Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            title,
            style: myFontTitleLarge,
            textAlign: TextAlign.start,
          ),
        ),
      )
    ],
  );
}

Widget dividerMedium(String title) {
  return Column(
    children: [
      const Divider(),
      Container(
        padding: const EdgeInsets.only(left: 20, top: 16, bottom: 20),
        child: Align(
          alignment: AlignmentDirectional.centerEnd,
          child: Text(
            title,
            style: myFontTitleMedium,
            textAlign: TextAlign.start,
          ),
        ),
      )
    ],
  );
}

Widget dividerMediumWithIcons(String title) {
  return Column(
    children: [
      const Divider(),
      Row(
        children: [
          IconButton(
            onPressed: () => print('Previus page'),
            icon: iconPrev, // Replace with your desired icon
          ),
          IconButton(
            onPressed: () => print('Next page'),
            icon: iconNext, // Replace with your desired icon
          ),
          Container(
            padding: const EdgeInsets.only(left: 200, top: 16, bottom: 20),
            child: Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Text(
                title,
                style: myFontTitleMedium,
                textAlign: TextAlign.start,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
