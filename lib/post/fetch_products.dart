import '../dependecies.dart';

var productApiUrl = 'http://www.diceandtiles.xyz/api/products/';

class ApiService {
  final Dio _dio = Dio();

  Future<List<dynamic>> fetchProducts({
    int page = 1,
    int pageSize = 10,
    String? sortType,
  }) async {
    try {
      // Build the query parameters map
      final queryParameters = {
        'page': page.toString(),
        'page_size': pageSize.toString(),
      };

      // Include sortType in the query parameters if it's not null
      if (sortType != null) {
        queryParameters['sort_by'] = sortType;
      }

      final response = await _dio.get(
        productApiUrl,
        queryParameters: queryParameters,
      );
      List<dynamic> list = [
        ProductList.fromJson(response.data),
        response.data['count'],
        response.data['next'],
        response.data['previous']
      ];
      return list;
    } on DioException catch (e) {
      // Handle error
      throw Exception('Failed to load data: ${e.message}');
    }
  }

  Future<List<dynamic>> fetchProductsFromUrl({required String apiUrl}) async {
    try {
      final response = await _dio.get(
        apiUrl,
      );
      List<dynamic> list = [
        ProductList.fromJson(response.data),
        response.data['count'],
        response.data['next'],
        response.data['previous']
      ];
      return list;
    } on DioException catch (e) {
      // Handle error
      throw Exception('Failed to load data: ${e.message}');
    }
  }

  Future<ProductDetails> fetchProductDetails(var productName) async {
    try {
      final response = await _dio.get('$productApiUrl$productName/');
      return ProductDetails.fromJson(response.data);
    } on DioException catch (e) {
      // Handle error
      throw Exception('Failed to load data: ${e.message}');
    }
  }
}
