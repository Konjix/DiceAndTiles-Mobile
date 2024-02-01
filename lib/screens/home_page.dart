import 'package:dice_and_tiles/dependecies.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProductList? _productList;

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    try {
      final apiResponse = await ApiService().fetchProducts(sortType: 'id_desc');
      setState(() {
        _productList = apiResponse[0];
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
                  dividerLarge('Nowości'),
                  Expanded(
                    child: buildProductList(_productList!.products, context),
                  ),
                ],
              ),
            ),
    );
  }
}
