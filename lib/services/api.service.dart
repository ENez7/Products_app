import 'dart:convert';
import 'dart:developer';
import 'package:ecommerce_platform/models/product.dart';
import 'package:ecommerce_platform/services/response.dart';
import 'package:http/http.dart' as http;

class ApiService {
  // LINK CONSULTAS
  static const _request =
      'https://functionentradaproducts.azurewebsites.net/api/products/'; // ?id=1';

  static Future<void> getProductsRequest() async {
    var req = await http.get(Uri.parse(_request));
    Future.delayed(Duration(seconds: 10));
    return;
  }

  static Future<void> postProductsRequest(Product product) async {
    var req = await http.post(
      Uri.parse(_request),
      body: jsonEncode(
        {
          'id': product.id,
          'name': product.productName,
          'category': 'category',
          'description': product.productDescription,
          'imageUrl': product.productImage,
          'price': product.productPrice,
          'stock': product.quantity,
        },
      ),
    );
    Future.delayed(Duration(seconds: 10));
    return;
  }

  static Future<void> putProductsRequest(Product product) async {
    var req = await http.put(
      Uri.parse('$_request?id=${product.id}'),
      body: jsonEncode(
        {
          'id': product.id,
          'name': product.productName,
          'category': 'category',
          'description': product.productDescription,
          'imageUrl': product.productImage,
          'price': product.productPrice,
          'stock': product.quantity,
        },
      ),
    );
    Future.delayed(Duration(seconds: 10));
    return;
  }

  static Future<void> deleteProductsRequest(String id) async {
    var req = await http.delete(
      Uri.parse('$_request?id=$id'),
    );
    Future.delayed(Duration(seconds: 10));
    return;
  }

  // =============================
  // GET PRODUCTS
  static const _getResponse =
      'https://webapisalidaproducts.azurewebsites.net/products/get';

  static Future<List<Product>> getProductsResponse() async {
    await getProductsRequest();
    var data = await http.get(
      Uri.parse(_getResponse),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
    try {
      Response newResponse = Response.fromJson(json.decode(data.body));
      List<Product> products = [];
      for (int i = 0; i < newResponse.products!.length; i++) {
        products.add(Product.fromJSON(newResponse.products![i]));
      }
      return products;
    } on Exception catch (e) {
      throw Exception();
    }
  }

  // POST PRODUCTS
  static const _postResponse =
      'https://webapisalidaproducts.azurewebsites.net/products/post';
  static Future<void> postProductsResponse(Product product) async {
    await postProductsRequest(product);
    await http.get(
      Uri.parse(_postResponse),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
    return;
  }

  // PUT PRODUCTS
  static const _putResponse =
      'https://webapisalidaproducts.azurewebsites.net/products/put';
  static Future<void> putProductsResponse(Product product) async {
    await putProductsRequest(product);
    await http.get(
      Uri.parse(_putResponse),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
    return;
  }

  // DELETE PRODUCTS
  static const _deleteResponse =
      'https://webapisalidaproducts.azurewebsites.net/products/delete';
  static Future<void> deleteProductsResponse(String id) async {
    await deleteProductsRequest(id);
    await http.get(
      Uri.parse(_deleteResponse),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
    return;
  }
}
