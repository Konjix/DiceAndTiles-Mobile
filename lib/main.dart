import 'dependecies.dart';

import 'package:dice_and_tiles/screens/collection_page.dart';
import 'package:dice_and_tiles/screens/home_page.dart';
import 'package:dice_and_tiles/screens/list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DiceAndTiles Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainPages(title: 'DiceAndTiles Demo'),
    );
  }
}

class MainPages extends StatefulWidget {
  const MainPages({super.key, required this.title});

  final String title;

  @override
  State<MainPages> createState() => _MainPagesState2();
}

class _MainPagesState extends State<MainPages> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar(context),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: iconHome,
            icon: iconHomeOutline,
            label: 'Startowa',
          ),
          NavigationDestination(
            selectedIcon: iconList,
            icon: iconListOutline,
            label: 'Lista gier',
          ),
          NavigationDestination(
            selectedIcon: iconCollection,
            icon: iconCollectionOutline,
            label: 'Kolekcja',
          ),
        ],
      ),
      body: <Widget>[
        homePage(),
        listPage(),
        collectionPage(),
      ][currentPageIndex],
    );
  }
}

class _MainPagesState2 extends State<MainPages> {
  int currentPageIndex = 0;
  late Future<ProductList> futureProductList;

  @override
  void initState() {
    super.initState();
    futureProductList = fetchProductList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar(context),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: iconHome,
            icon: iconHomeOutline,
            label: 'Startowa',
          ),
          NavigationDestination(
            selectedIcon: iconList,
            icon: iconListOutline,
            label: 'Lista gier',
          ),
          NavigationDestination(
            selectedIcon: iconCollection,
            icon: iconCollectionOutline,
            label: 'Kolekcja',
          ),
        ],
      ),
      body: <Widget>[
        futureHomePage(futureProductList),
        futureListPage(futureProductList),
        collectionPage(),
      ][currentPageIndex],
    );
  }
}
