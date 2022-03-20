import 'dart:convert';
import 'dart:developer';
import 'package:ecommerce_platform/models/product.dart';
import 'package:ecommerce_platform/services/response.dart';
import 'package:http/http.dart' as http;

class ApiService {
  // LINK CONSULTAS
  static const _request =
      'https://functionentradaproducts.azurewebsites.net/api/products/';

  static Future<void> getProductsRequest() async {
    var req = await http.get(Uri.parse(_request));
    Future.delayed(Duration(seconds: 10));
    print('------REQUEST------');
    print(req.statusCode);
    return;
  }
  // LINK RESPUESTAS

  static const _getResponse =
      'https://webapisalidaproducts.azurewebsites.net/products/get';

  static Future<List<Product>> getProductsResponse() async {
    await getProductsRequest();
    print('------RESPONSE------');
    // La peticion se hace y luego se espera la respuesta
    var data = await http.get(
      Uri.parse(_getResponse),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
    print('------DATA------');
    print(data.statusCode);
    // log(data.body);
    Response newResponse = Response.fromJson(json.decode(data.body));
    List<Product> products = [];
    // print(newResponse.products![0]['name']);
    for (int i = 0; i < newResponse.products!.length; i++) {
      products.add(Product.fromJSON(newResponse.products![i]));
    }
    print('QTY: ${products[0].productName}');
    return products;
  }
}
