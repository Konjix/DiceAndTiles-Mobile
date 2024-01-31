class ProductDetails {
  final int id;
  final String slug;
  final String name;
  final String thumbnail;
  final double positiveRate;
  final int minPlayers;
  final int maxPlayers;
  final String description;
  final String image1;
  final String image2;
  final String image3;
  final String image4;
  final String image5;
  //final bool user_vote;

  ProductDetails({
    required this.slug,
    required this.id,
    required this.name,
    required this.thumbnail,
    required this.positiveRate,
    required this.minPlayers,
    required this.maxPlayers,
    required this.description,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
    required this.image5,
  });

  factory ProductDetails.fromJson(Map<String, dynamic> parsedJson) {
    int upvotes = parsedJson['upvotes'];
    int downvotes = parsedJson['downvotes'];
    double rate = (upvotes + downvotes != 0)
        ? (upvotes / (upvotes + downvotes) * 100).roundToDouble()
        : 50;

    return ProductDetails(
      id: parsedJson['id'],
      slug: parsedJson['slug'],
      name: parsedJson['name'],
      thumbnail: parsedJson['thumbnail'],
      positiveRate: rate,
      description: parsedJson['description'],
      image1: parsedJson['image1'],
      image2: parsedJson['image2'],
      image3: parsedJson['image3'],
      image4: parsedJson['image4'],
      image5: parsedJson['image5'],
      maxPlayers: parsedJson['maxPlayers'],
      minPlayers: parsedJson['minPlayers'],
    );
  }
}
