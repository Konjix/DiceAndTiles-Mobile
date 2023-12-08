import 'package:http/http.dart' as http;

import '../dependecies.dart';

Future<ProductList> fetchProductList() async {
  final response = await http
      .get(Uri.parse('http://192.168.1.48:8000/fetchedproducts/?format=json'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return ProductList.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load post');
  }
}
