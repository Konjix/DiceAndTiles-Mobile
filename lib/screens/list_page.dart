import 'package:dice_and_tiles/dependecies.dart';

Widget listPage() {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      children: <Widget>[
        //dividerMedium('1 z 20'),
        dividerMediumWithIcons('1 z 20'),
        Expanded(
          child: ListView(
            children: <Widget>[
              cardOpinion(
                  photo: photoFlutter,
                  title: 'Gra planszowa 1',
                  icon: iconFaceHappy),
              cardOpinion(
                  photo: photoFlutter,
                  title: 'Gra planszowa 2',
                  icon: iconFaceSad),
              cardOpinion(
                  photo: photoFlutter,
                  title: 'Gra planszowa 3',
                  icon: iconFaceHappy),
              cardOpinion(
                  photo: photoFlutter,
                  title: 'Gra planszowa 4',
                  icon: iconFaceNeutral),
              cardOpinion(
                  photo: photoFlutter,
                  title: 'Gra planszowa 5',
                  icon: iconFaceHappy),
              cardOpinion(
                  photo: photoFlutter,
                  title: 'Gra planszowa 6',
                  icon: iconFaceHappy),
              cardOpinion(
                  photo: photoFlutter,
                  title: 'Gra planszowa 7',
                  icon: iconFaceSad),
              cardOpinion(
                  photo: photoFlutter,
                  title: 'Gra planszowa 8',
                  icon: iconFaceSad),
              cardOpinion(
                  photo: photoFlutter,
                  title: 'Gra planszowa 9',
                  icon: iconFaceNeutral),
              cardOpinion(
                  photo: photoFlutter,
                  title: 'Gra planszowa 10',
                  icon: iconFaceHappy),
            ],
          ),
        ),
      ],
    ),
  );
}

class FutureListPage extends StatefulWidget {
  final Future<ProductList> futureProductList;
  int page;
  int state = 0;

  FutureListPage({required this.futureProductList, required this.page});

  @override
  _FutureListPageState createState() => _FutureListPageState();
}

class _FutureListPageState extends State<FutureListPage> {
  void changePage(int newPage, int allPages) {
    setState(
      () {
        widget.page = newPage;
        if (widget.page == 1) {
          widget.state = 0;
        } else if (widget.page == allPages) {
          widget.state = 2;
        } else {
          widget.state = 1;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Expanded(
        child: FutureBuilder<ProductList>(
          future: widget.futureProductList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Product> productList = snapshot.data!.products;
              var allPages = (productList.length / 10).round();
              int lastGameOnPageId = 10 + (widget.page - 1) * 10;
              if (lastGameOnPageId > productList.length) {
                lastGameOnPageId = productList.length;
              }
              return Column(
                children: <Widget>[
                  dividerMediumWithIconsDynamic(
                    () => changePage(widget.page - 1, allPages),
                    () => changePage(widget.page + 1, allPages),
                    '${widget.page} z $allPages',
                    widget.state,
                  ),
                  Expanded(
                    child: shortList(
                      productList,
                      1 + (widget.page - 1) * 10,
                      lastGameOnPageId,
                    ),
                  ),
                ],
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
    );
  }
}

Widget futureListPage(Future<ProductList> futureProductList) {
  return FutureListPage(
    futureProductList: futureProductList,
    page: 1,
  );
}
