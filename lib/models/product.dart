class Product {
  final String productName;
  final double productPrice;
  final String productDescription;
  final String? productImage;
  final int? quantity;
  final String? id;

  Product({
    required this.productName,
    required this.productPrice,
    required this.productDescription,
    this.productImage,
    this.quantity,
    this.id,
  });

  factory Product.fromJSON(json) {
    return Product(
      id: json['id'],
      productName: json['name'],
      productDescription: json['description'],
      productImage: json['imageUrl'],
      productPrice: json['price'],
      quantity: json['stock'],
    );
  }

  Product copyWith(
      {String? prodName,
      double? prodPrice,
      String? prodDesc,
      String? prodImg,
      int? qty,
      String? id}) {
    return Product(
      productName: prodName ?? productName,
      productPrice: prodPrice ?? productPrice,
      productDescription: prodDesc ?? productDescription,
      productImage: prodImg ?? productImage,
      quantity: qty ?? quantity,
      id: id ?? this.id,
    );
  }
}
