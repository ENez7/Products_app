import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_platform/data/streamdata.dart';
import 'package:ecommerce_platform/pages/cubits/homecubit_cubit.dart';
import 'package:ecommerce_platform/widgets/search_bar.dart';
import 'package:ecommerce_platform/constants/colors.dart';
import 'package:ecommerce_platform/widgets/products_card.dart';
import 'package:ecommerce_platform/widgets/sliverappbar.dart';

import '../models/product.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<Product> products = [];
    final dataCubit = context.read<HomeCubit>();
    dataCubit.initState();
    dataCubit.loadDataInList(StreamData.productStream(7), products);

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
                    color: ConstColors.background,
                    child: Column(
                      children: [
                        SearchBar(),
                        BlocBuilder<HomeCubit, HomeCubitState>(
                          builder: (_, state) {
                            switch (state.runtimeType) {
                              case HomeCubitLoadingState:
                                return CircularProgressIndicator();
                              case HomeCubitLoadedState:
                                return _getListWidgets(products);
                              default:
                                return Text('No se que mambo');
                            }
                          },
                        ),
                      ],
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

  // CREATE A COLUMN BASED ON LIST OF PRODUCTS
  Widget _getListWidgets(List<Product> lstItens) {
    return Column(
        children: lstItens
            .map((product) => ProductsCard(
                productName: product.productName,
                productPrice: product.productPrice,
                productDescription: product.productDescription))
            .toList());
  }
}
