import 'package:ecommerce_platform/pages/product.page.dart';
import 'package:ecommerce_platform/services/api.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_platform/data/streamdata.dart';
import 'package:ecommerce_platform/widgets/search_bar.widget.dart';
import 'package:ecommerce_platform/constants/colors.dart';
import 'package:ecommerce_platform/widgets/products_card.widget.dart';
import 'package:ecommerce_platform/widgets/sliverappbar.widget.dart';

import '../models/product.dart';
import 'cubits/home/homecubit_cubit.dart';

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
    dataCubit.loadDataInList(ApiService.getProducts(), products);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
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
                                return SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.75,
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              case HomeCubitLoadedState:
                                return _getListWidgets(products);
                              default:
                                return SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.75,
                                  child: Center(
                                    child: Text('Sin datos'),
                                  ),
                                );
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
          onPressed: () {
            Navigator.of(context).pushNamed('/form');
          },
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
  Widget _getListWidgets(List<Product> items) {
    return Column(
        children: items
            .map((product) => ProductsCard(
                  product: product,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => ProductPage(product: product),
                      ),
                    );
                  },
                ))
            .toList());
  }
}
