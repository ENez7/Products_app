import 'package:ecommerce_platform/constants/colors.dart';
import 'package:ecommerce_platform/models/product.dart';
import 'package:ecommerce_platform/pages/form.page.dart';
import 'package:ecommerce_platform/services/api.service.dart';
import 'package:flutter/material.dart';
import '../widgets/product_card.widget.dart';

class ProductPage extends StatelessWidget {
  final Product product;
  const ProductPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Focus.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Productos CRUD'),
          centerTitle: true,
          backgroundColor: ConstColors.appBar,
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Container(
            // height: MediaQuery.of(context).size.height,
            color: ConstColors.background,
            child: Column(
              children: [
                ProductCard(product: product),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 110,
                      height: 46,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => FormPage(
                                product: product,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          'Editar',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: ConstColors.buttonBackground,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 110,
                      height: 46,
                      child: ElevatedButton(
                        onPressed: () {
                          ApiService.deleteProductsResponse(product.id!);
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Eliminar',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
