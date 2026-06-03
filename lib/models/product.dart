class Product {

  String id;
  String name;
  double price;
  String category;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
  });

  factory Product.fromMap(
      Map<String, dynamic> data,
      String documentId) {

    return Product(
      id: documentId,
      name: data['name'] ?? '',
      price:
      (data['price'] ?? 0).toDouble(),
      category:
      data['category'] ?? '',
    );
  }
}