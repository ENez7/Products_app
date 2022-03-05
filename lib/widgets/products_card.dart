import 'package:ecommerce_platform/constants/colors.dart';
import 'package:flutter/material.dart';

class ProductsCard extends StatelessWidget {
  final String productName;
  final String productPrice;
  final String productDescription;
  final String? productImage;
  final VoidCallback? onTap;
  final bool disabled;

  const ProductsCard({
    Key? key,
    required this.productName,
    required this.productPrice,
    required this.productDescription,
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
              color: ConstColors.shadow,
              blurRadius: 10,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 97,
              width: 108,
              margin: EdgeInsets.fromLTRB(18, 12, 15, 12),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            Container(
              height: 97,
              width: 210,
              margin: EdgeInsets.fromLTRB(0, 12, 18, 12),
              decoration: BoxDecoration(
                // color: Colors.grey,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    productPrice,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: ConstColors.fonts,
                    ),
                  ),
                  SizedBox(height: 7),
                  Text(
                    productDescription,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
