class Product {
  final String productName;
  final String productPrice;
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
      productName: json['productName'],
      productPrice: json['productPrice'],
      productDescription: json['productDescription'],
      productImage: json['productImage'],
      quantity: json['quantity'],
      id: json['id'],
    );
  }

  Product copyWith(
      {String? prodName,
      String? prodPrice,
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
