import 'package:ecommerce_platform/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_platform/constants/colors.dart';
import 'package:ecommerce_platform/widgets/products_card.dart';
import 'package:ecommerce_platform/widgets/sliverappbar.dart';

import '../data/streamdata.dart';
import '../models/product.dart';

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
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SearchBar(),
                            _productsCardLV(getProducts()),
                          ],
                        ),
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

  Future<List<Product>> getProducts() async {
    Stream<Product> stream = StreamData.productStream(7);
    List<Product> productos = [];
    await for (Product producto in stream) {
      productos.add(producto);
    }
    return productos;
  }

  ListView _productsCardLV(data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return ProductsCard(
          productName: data[index].productName,
          productPrice: data[index].productPrice,
          productDescription: data[index].productDescription,
          productImage: data[index].productImage,
        );
      },
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
          productName: 'Producto',
          productPrice: 'Bs. 145.00',
          productDescription:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce at eros sed purus pulvinar egestas.',
        ),
        ProductsCard(
          productName: '',
          productPrice: '',
          productDescription: '',
        ),
        ProductsCard(
          productName: '',
          productPrice: '',
          productDescription: '',
        ),
        ProductsCard(
          productName: '',
          productPrice: '',
          productDescription: '',
        ),
        ProductsCard(
          productName: '',
          productPrice: '',
          productDescription: '',
        ),
        ProductsCard(
          productName: '',
          productPrice: '',
          productDescription: '',
        ),
        ProductsCard(
          productName: '',
          productPrice: '',
          productDescription: '',
        ),
      ],
    );
  }
}
