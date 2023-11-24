import 'package:flutter/material.dart';
import 'package:dice_and_tiles/resources/icons.dart';

const Widget photoFlutter = FlutterLogo(size: 56.0);

Widget cardMain({required Widget photo, required String title}) {
  return TextButton(
    onPressed: () => print('Show game details'),
    child: ListTile(
      leading: photo,
      title: Text(title),
      subtitle: const Text(''),
    ),
  );
}

Widget cardOpinion(
    {required Widget photo, required String title, required Widget icon}) {
  return TextButton(
    onPressed: () => print('Show game details'),
    child: ListTile(
      leading: photo,
      title: Text(title),
      subtitle: const Text(''),
      trailing: icon,
    ),
  );
}

Widget cardCollection({required Widget photo, required String title}) {
  return TextButton(
    onPressed: () => print('Show game details'),
    child: ListTile(
      leading: photo,
      title: Text(title),
      trailing: IconButton(
        onPressed: () => print('Remove game from collection'),
        icon: iconDelete,
      ),
    ),
  );
}

Widget cardCollectionAdd() {
  return TextButton(
    onPressed: () => print('Add game to collection'),
    child: const ListTile(
      leading: iconAdd,
      title: Text('Dodaj grę do swojej kolekcji'),
    ),
  );
}
