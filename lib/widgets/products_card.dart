import 'package:flutter/material.dart';

class ProductsCard extends StatelessWidget {
  final String productName;
  final String productPrice;
  final String? productDescription;
  final String? productImage;
  final VoidCallback? onTap;
  final bool disabled;

  const ProductsCard({
    Key? key,
    required this.productName,
    required this.productPrice,
    this.productDescription,
    this.productImage,
    this.onTap,
    this.disabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: disabled ? null : onTap,
      child: Container(
        height: 124,
        width: MediaQuery.of(context).size.width * 0.9,
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Text(productName),
      ),
    );
  }
}
