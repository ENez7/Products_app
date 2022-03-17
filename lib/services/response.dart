import '../models/product.dart';

class Response {
  final String method;
  final bool success;
  final List<Product>? products;
  final Product? product;
  final String? id;

  Response(this.success, this.method, {this.products, this.product, this.id});

  factory Response.fromJson(String method, bool success,
      List<Product>? products, Product? product, String? id) {
    return Response(
      success,
      method,
      products: products ?? [],
      product: product,
      id: id ?? '',
    );
  }
}
