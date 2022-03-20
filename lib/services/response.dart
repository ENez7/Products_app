import '../models/product.dart';

class Response {
  final String method;
  final bool success;
  final List<dynamic>? products;
  final String? id;

  Response(this.success, this.method, {this.products, this.id});

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      json['success'] as bool,
      json['method'] as String,
      id: json['id'] as String?,
      products: json['data'] as List<dynamic>?,
    );
  }

  @override
  String toString() {
    return 'Response{method: $method\n, success: $success\n, products: $products\n, id: $id\n}';
  }
}
