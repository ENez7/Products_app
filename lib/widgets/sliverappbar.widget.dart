import 'package:flutter/material.dart';
import 'package:ecommerce_platform/constants/colors.dart';

class SliverCustomAppBar extends StatelessWidget {
  final String title;
  final bool implyLeading;
  final Color? backgroundColor;

  const SliverCustomAppBar({
    Key? key,
    required this.title,
    this.implyLeading = false,
    this.backgroundColor = ConstColors.appBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: true,
      expandedHeight: 120,
      collapsedHeight: 70,
      automaticallyImplyLeading: implyLeading,
      backgroundColor: backgroundColor,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          title,
          textAlign: TextAlign.left,
        ),
        titlePadding: const EdgeInsetsDirectional.only(
          start: 24,
          bottom: 16,
        ),
      ),
    );
  }
}
