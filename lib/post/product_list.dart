import 'package:dice_and_tiles/post/product.dart';

class ProductList {
  final List<Product> products;

  ProductList({required this.products});

  factory ProductList.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['results'] as List;
    List<Product> resultsList = list.map((i) => Product.fromJson(i)).toList();

    return ProductList(
      products: resultsList,
    );
  }
}
