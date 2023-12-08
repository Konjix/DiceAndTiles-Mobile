class Product {
  final int id;
  final int bggid;
  final String name;
  final String description;
  final int minPlayers;
  final int maxPlayers;
  final String imageURL;
  final String thumbnailURL;

  Product(
      {required this.id,
      required this.bggid,
      required this.name,
      required this.description,
      required this.minPlayers,
      required this.maxPlayers,
      required this.imageURL,
      required this.thumbnailURL});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      bggid: json['bggid'],
      name: json['name'],
      description: json['description'],
      //category
      minPlayers: json['min_players'],
      maxPlayers: json['max_players'],
      imageURL: json['image_url'],
      thumbnailURL: json['thumbnail_url'],
    );
  }
}
