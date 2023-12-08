import 'package:dice_and_tiles/post/product.dart';

class ProductList {
  final List<Product> products;

  ProductList({required this.products});

  factory ProductList.fromJson(List<dynamic> json) {
    //var list = json['results'] as List;
    List<Product> resultsList = json.map((i) => Product.fromJson(i)).toList();

    return ProductList(
      products: resultsList,
    );
  }
}
