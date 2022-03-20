import 'package:ecommerce_platform/constants/colors.dart';
import 'package:ecommerce_platform/constants/shadows.dart';
import 'package:ecommerce_platform/models/product.dart';
import 'package:flutter/material.dart';

class ProductsCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;
  final bool disabled;

  const ProductsCard({
    Key? key,
    required this.product,
    this.onTap,
    this.disabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: disabled ? null : onTap,
      child: Container(
        height: 180,
        width: MediaQuery.of(context).size.width * 0.9,
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: CustomShadows.getContainerShadow(),
        ),
        child: Row(
          children: [
            ImageContainer(),
            DataContainer(
              productName: product.productName,
              productPrice: product.productPrice.toString(),
              productDescription: product.productDescription,
            ),
          ],
        ),
      ),
    );
  }
}

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 97,
      width: 108,
      margin: EdgeInsets.fromLTRB(18, 12, 15, 12),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(
            'assets/bg.jpg',
          ),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class DataContainer extends StatelessWidget {
  const DataContainer({
    Key? key,
    required this.productName,
    required this.productPrice,
    required this.productDescription,
  }) : super(key: key);

  final String productName;
  final String productPrice;
  final String productDescription;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 210,
      margin: EdgeInsets.fromLTRB(0, 12, 18, 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
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
          SizedBox(height: 14),
          SizedBox(
            height: 70,
            child: Text(
              productDescription,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ),
          // SizedBox(height: 5),
        ],
      ),
    );
  }
}
