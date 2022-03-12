import 'dart:async';
import 'dart:math';
import 'package:ecommerce_platform/models/product.dart';

class StreamData {
  // Generate random data
  static Stream<Product> productStream(int max) async* {
    for (int i = 0; i < max; i++) {
      final rand = Random();
      final product = Product(
        productName: 'Producto ${i + 1}',
        productPrice: 'Bs. ${100 + rand.nextInt(100)}.00',
        productDescription:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce at eros sed purus pulvinar egestas.',
        quantity: 10 + rand.nextInt(90),
        id: '1683069414',
      );
      // print('xd');
      await Future.delayed(Duration(milliseconds: 400));
      yield product;
    }
  }
}
