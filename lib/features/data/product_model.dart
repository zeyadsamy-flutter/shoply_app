class ProductModel {
  final num id;
  final num price;
  final num rating;
  final String thumbnail;
  final String title;

  const ProductModel({
    required this.id,
    required this.price,
    required this.rating,
    required this.thumbnail,
    required this.title,
  });

  ProductModel.fromJson(Map<String, dynamic> data)
    : id = data["id"],
      price = data["price"],
      rating = data["rating"],
      thumbnail = data["thumbnail"],
      title = data["title"];
}
