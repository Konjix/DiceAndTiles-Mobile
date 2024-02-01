import '../dependecies.dart';

Widget buildProductList(List<Product> productList, BuildContext context,
    {int listLength = 10}) {
  List<Widget> listOfCards = [];
  if (productList.length < listLength) listLength = productList.length;
  for (int i = 0; i < listLength; i++) {
    listOfCards.add(cardMain(productList.elementAt(i), context));
  }
  return ListView(
    children: listOfCards,
  );
}

Widget buildOpinionProductList(List<Product> productList, BuildContext context,
    {int listLength = 10}) {
  List<Widget> listOfCards = [];
  if (productList.length < listLength) listLength = productList.length;
  for (int i = 0; i < listLength; i++) {
    listOfCards.add(cardOpinion(productList.elementAt(i), context));
  }
  return ListView(
    children: listOfCards,
  );
}
