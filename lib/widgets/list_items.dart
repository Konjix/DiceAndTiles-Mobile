import 'package:flutter/material.dart';
import 'package:dice_and_tiles/resources/icons.dart';
import 'package:dice_and_tiles/post/product.dart';

const Widget photoFlutter = FlutterLogo(size: 64.0);

Widget productCard(Product product) {
  Image image = Image.network(product.thumbnailURL);
  return cardMain(photo: image, title: product.name);
}

Widget cardMain({required Widget photo, required String title}) {
  return TextButton(
    onPressed: () => print('Show game details'),
    child: ListTile(
      leading: SizedBox(
        width: 64.0,
        height: 64.0,
        child: photo,
      ),
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
