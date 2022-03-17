import 'dart:convert';

import '../models/product.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const _getUrl =
      'https://functiongetproducts.azurewebsites.net/api/products';
  static const _getByIdUrl =
      'https://functiongetbyidproducts.azurewebsites.net/api/products/';
  static const _postUrl =
      'https://functionpostproducts.azurewebsites.net/api/products';
  static const _deleteUrl =
      'https://functiondeleteproducts.azurewebsites.net/api/products/';

  static Future<List<dynamic>> getProducts() async {
    final response = await http.get(Uri.parse(_getUrl), headers: {
      'Content-Type': 'application/json',
    });
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final List<dynamic> products = jsonResponse['data'];
      print('---------PRODUCTO');
      print(products[0]);
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }
}
