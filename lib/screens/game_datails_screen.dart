import '../dependecies.dart';

class GameDetailsScreen extends StatefulWidget {
  final Product productInfo;

  //const GameDetailsScreen({Key? key, this.productInfo}) : super(key: key);
  const GameDetailsScreen({Key? key, required this.productInfo})
      : super(key: key);

  @override
  _GameDetailsScreenState createState() => _GameDetailsScreenState();
}

class _GameDetailsScreenState extends State<GameDetailsScreen> {
  ProductDetails? _detailedProductInfo;

  @override
  void initState() {
    super.initState();
    _loadDetailedProductInfo(widget.productInfo);
  }

  Future<void> _loadDetailedProductInfo(Product productInfo) async {
    try {
      final apiResponse =
          await ApiService().fetchProductDetails(widget.productInfo.slug);
      setState(() {
        _detailedProductInfo = apiResponse;
      });
    } catch (e) {
      // Handle the error or show an error message
    }
  }

  Widget _chooseIcon(double positiveRate) {
    if (positiveRate >= 70) {
      return iconFaceHappy;
    } else if (positiveRate > 40) {
      return iconFaceNeutral;
    }
    return iconFaceSad;
  }

  String _formatDescriptionFromHtml(String descrition) {
    var unescape = HtmlUnescape();
    String decodedDescription =
        unescape.convert(_detailedProductInfo!.description);
    return decodedDescription.replaceAll('&#10;', '\n');
  }

  List<String> _getParagraphList(String descrition) {
    String wholeDescrition = _formatDescriptionFromHtml(descrition);
    List<String> paragraphList = wholeDescrition.split('\n\n');
    return paragraphList;
  }

  List<String> _createGalleryUrls(ProductDetails productDetails) {
    List<String> imageUrls = [
      productDetails.image1,
      productDetails.image2,
      productDetails.image3,
      productDetails.image4,
      productDetails.image5
    ];
    return imageUrls;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            //topBarBack(widget.productInfo?.name ?? 'Product Details', context),
            topBarBack(widget.productInfo.name, context),
        body: _detailedProductInfo == null
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 200,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                              12.0), // Reguluj promień zaokrąglenia według potrzeb
                          child: Image.network(
                            _detailedProductInfo!
                                .thumbnail, // Podmień na URL obrazu
                            fit:
                                BoxFit.cover, // Dopasowanie obrazu do kontenera
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        'Minimalnie graczy: ${_detailedProductInfo!.minPlayers}'),
                                    Text(
                                        'Maksymalnie graczy: ${_detailedProductInfo!.maxPlayers}'),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                  width: 16.0), // Odstęp między kolumnami
                              Expanded(
                                  child: Column(
                                children: [
                                  _chooseIcon(
                                      _detailedProductInfo!.positiveRate),
                                  Text(
                                    '${_detailedProductInfo!.positiveRate.round()}% pozytywnych opinii',
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              )),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Text(
                                _getParagraphList(
                                    _detailedProductInfo!.description)[0],
                                textAlign: TextAlign.center),
                          ),
                        ]),
                      ),
                      dividerMedium('Galeria'),
                      HorizontalImageList(
                          imageUrls: _createGalleryUrls(_detailedProductInfo!)),
                      dividerMedium('Rekomendacje'),
                      dividerMedium('Opinie o grze'),
                    ],
                  ),
                ),
              ));
  }
}
