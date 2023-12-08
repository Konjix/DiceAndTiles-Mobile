import '../dependecies.dart';

Widget shortList(List<Product> productList, int start, int end) {
  List<Widget> listOfCards = [];
  for (int i = start; i < end; i++) {
    listOfCards.add(productCard(productList.elementAt(i)));
  }
  return ListView(
    children: listOfCards,
  );
}
