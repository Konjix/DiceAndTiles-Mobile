class Product {
  final int id;
  final String slug;
  final String name;
  final String thumbnail;
  final double positiveRate;

  Product(
      {required this.slug,
      required this.id,
      required this.name,
      required this.thumbnail,
      required this.positiveRate});

  factory Product.fromJson(Map<String, dynamic> parsedJson) {
    int upvotes = parsedJson['upvotes'];
    int downvotes = parsedJson['downvotes'];
    double rate = (upvotes + downvotes != 0)
        ? (upvotes / (upvotes + downvotes) * 100)
        : 50;

    return Product(
      id: parsedJson['id'],
      slug: parsedJson['slug'],
      name: parsedJson['name'],
      thumbnail: parsedJson['thumbnail'],
      positiveRate: rate,
    );
  }
}
