import 'package:dice_and_tiles/dependecies.dart';

Widget collectionPage() {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      children: <Widget>[
        Expanded(
          child: ListView(
            children: <Widget>[
              cardCollection(photo: photoFlutter, title: 'Gra planszowa 1'),
              cardCollection(photo: photoFlutter, title: 'Gra planszowa 2'),
              cardCollection(photo: photoFlutter, title: 'Gra planszowa 3'),
              cardCollection(photo: photoFlutter, title: 'Gra planszowa 4'),
              cardCollection(photo: photoFlutter, title: 'Gra planszowa 5'),
              cardCollectionAdd(),
            ],
          ),
        ),
      ],
    ),
  );
}
