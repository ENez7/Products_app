import 'package:ecommerce_platform/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_platform/constants/colors.dart';
import 'package:ecommerce_platform/widgets/products_card.dart';
import 'package:ecommerce_platform/widgets/sliverappbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            const SliverCustomAppBar(title: 'Productos CRUD'),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Container(
                    color: const Color(0xFFE5E5E5),
                    child: const Center(
                      child: SingleChildScrollView(
                        child: ColumnData(),
                      ),
                    ),
                  );
                },
                childCount: 1,
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Text(
            '+',
            style: TextStyle(
              fontSize: 36,
              color: Colors.white,
            ),
          ),
          backgroundColor: ConstColors.buttons,
        ),
      ),
    );
  }
}

class ColumnData extends StatelessWidget {
  const ColumnData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SearchBar(),
        ProductsCard(
          productName: '',
          productPrice: '',
        ),
        ProductsCard(
          productName: '',
          productPrice: '',
        ),
        ProductsCard(
          productName: '',
          productPrice: '',
        ),
        ProductsCard(
          productName: '',
          productPrice: '',
        ),
        ProductsCard(
          productName: '',
          productPrice: '',
        ),
        ProductsCard(
          productName: '',
          productPrice: '',
        ),
        ProductsCard(
          productName: '',
          productPrice: '',
        ),
      ],
    );
  }
}
