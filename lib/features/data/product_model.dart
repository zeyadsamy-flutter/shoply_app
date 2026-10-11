class ProductModel {
  final num id;
  final num price;
  final num rating;
  final String thumbnail;
  final String title;

  ProductModel(Map<String, dynamic> data)
    : id = data["id"],
      price = data["price"],
      rating = data["rating"],
      thumbnail = data["thumbnail"],
      title = data["title"];
}
