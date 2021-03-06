import 'package:ecommerce_platform/constants/colors.dart';
import 'package:ecommerce_platform/models/product.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      width: MediaQuery.of(context).size.width * 0.9,
      margin: EdgeInsets.symmetric(
        vertical: 24.0,
      ),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 10),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Container(
                  height: 194,
                  width: 301,
                  margin: EdgeInsets.symmetric(vertical: 24.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(product.productImage!),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '${product.quantity} disponibles',
                  style: TextStyle(
                    color: Color(0xff9DA0A7),
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ),
              Text(
                product.productName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36.0,
                ),
              ),
              Text(
                'ID ${product.id}',
                style: TextStyle(
                  color: Color(0xff9DA0A7),
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(
                height: 140,
                child: Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Text(
                      product.productDescription,
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  product.productPrice.toString(),
                  style: TextStyle(
                    color: Color(0xff9DA0A7),
                    fontWeight: FontWeight.bold,
                    fontSize: 28.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
