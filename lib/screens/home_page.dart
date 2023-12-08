import 'package:dice_and_tiles/dependecies.dart';

Widget homePage() {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      children: <Widget>[
        dividerLarge('Nowości'),
        Expanded(
          child: ListView(
            children: <Widget>[
              cardMain(photo: photoFlutter, title: 'Gra planszowa 1'),
              cardMain(photo: photoFlutter, title: 'Gra planszowa 2'),
              cardMain(photo: photoFlutter, title: 'Gra planszowa 3'),
              cardMain(photo: photoFlutter, title: 'Gra planszowa 4'),
              cardMain(photo: photoFlutter, title: 'Gra planszowa 5'),
              cardMain(photo: photoFlutter, title: 'Gra planszowa 6'),
              cardMain(photo: photoFlutter, title: 'Gra planszowa 7'),
              cardMain(photo: photoFlutter, title: 'Gra planszowa 8'),
              cardMain(photo: photoFlutter, title: 'Gra planszowa 9'),
              cardMain(photo: photoFlutter, title: 'Gra planszowa 10'),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget futureHomePage(Future<ProductList> futureProductList) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      children: <Widget>[
        dividerLarge('Nowości'),
        Expanded(
          child: FutureBuilder<ProductList>(
            future: futureProductList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Product> productList = snapshot.data!.products;
                var length = productList.length;
                return shortList(
                  productList,
                  length - 10,
                  length,
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ],
    ),
  );
}
