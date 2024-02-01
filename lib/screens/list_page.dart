import 'package:dice_and_tiles/dependecies.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ProductList? _productList;
  int? _pageCount;
  String? _nextPage;
  String? _previousPage;

  int _page = 1;

  @override
  void initState() {
    super.initState();
    _initialLoadProducts();
  }

  Future<void> _initialLoadProducts() async {
    try {
      final apiResponse = await ApiService().fetchProducts();
      setState(() {
        _productList = apiResponse[0];
        int count = apiResponse[1];
        _pageCount = (count / 10).round();
        _nextPage = apiResponse[2];
        _previousPage = apiResponse[3];
      });
    } catch (e) {
      // Handle the error or show an error message
    }
  }

  Future<void> _loadProductsFromUrl(String apiUrl) async {
    try {
      final apiResponse =
          await ApiService().fetchProductsFromUrl(apiUrl: apiUrl);
      setState(() {
        _productList = apiResponse[0];
        _nextPage = apiResponse[2];
        _previousPage = apiResponse[3];
      });
    } catch (e) {
      // Handle the error or show an error message
    }
  }

  void _goToPreviousPage() {
    try {
      _loadProductsFromUrl(_previousPage!);
      setState(() {
        _page = _page - 1;
      });
    } catch (e) {
      // Handle the error or show an error message
    }
  }

  void _goToNextPage() {
    try {
      _loadProductsFromUrl(_nextPage!);
      setState(() {
        _page = _page + 1;
      });
    } catch (e) {
      // Handle the error or show an error message
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _productList == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  dividerMediumWithIconsDynamic(
                      () => _goToPreviousPage(),
                      () => _goToNextPage(),
                      '$_page z $_pageCount',
                      _page,
                      _pageCount!),
                  Expanded(
                    child: buildOpinionProductList(
                        _productList!.products, context),
                  ),
                ],
              ),
            ),
    );
  }
}
