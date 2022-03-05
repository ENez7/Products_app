import 'package:ecommerce_platform/widgets/sliverappbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverCustomAppBar(title: 'Productos CRUD'),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Container(
                color: const Color(0xFFE5E5E5),
                height: MediaQuery.of(context).size.height,
              );
            },
            childCount: 1,
          ),
        ),
      ],
    );
  }
}
