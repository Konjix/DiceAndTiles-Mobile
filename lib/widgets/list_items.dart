import '../dependecies.dart';

const Widget photoFlutter = FlutterLogo(size: 64.0);

Widget cardMain(Product product, BuildContext context) {
  Image image = Image.network(product.thumbnail);
  return TextButton(
    onPressed: () {
      (
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => GameDetailsScreen(productInfo: product)),
        ),
      );
    },
    child: ListTile(
      leading: SizedBox(
        width: 64.0,
        height: 64.0,
        child: image,
      ),
      title: Text(product.name),
      subtitle: const Text(''),
    ),
  );
}

Widget cardOpinion(Product product, BuildContext context) {
  Widget icon = iconFaceSad;
  if (product.positiveRate >= 70) {
    icon = iconFaceHappy;
  } else if (product.positiveRate > 40) {
    icon = iconFaceNeutral;
  }
  Image image = Image.network(product.thumbnail);
  return TextButton(
    onPressed: () {
      (
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => GameDetailsScreen(productInfo: product)),
        ),
      );
    },
    child: ListTile(
      leading: SizedBox(
        width: 64.0,
        height: 64.0,
        child: image,
      ),
      title: Text(product.name),
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
