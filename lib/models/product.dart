class Product {
  final String productName;
  final String productPrice;
  final String productDescription;
  final String? productImage;

  Product({
    required this.productName,
    required this.productPrice,
    required this.productDescription,
    this.productImage,
  });

  factory Product.fromJSON(json) {
    return Product(
      productName: json['productName'],
      productPrice: json['productPrice'],
      productDescription: json['productDescription'],
      productImage: json['productImage'],
    );
  }

  Product copyWith(
      {String? prodName,
      String? prodPrice,
      String? prodDesc,
      String? prodImg}) {
    return Product(
      productName: prodName ?? productName,
      productPrice: prodPrice ?? productPrice,
      productDescription: prodDesc ?? productDescription,
      productImage: prodImg ?? productImage,
    );
  }
}
