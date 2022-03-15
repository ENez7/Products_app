import 'package:ecommerce_platform/constants/shadows.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class FormPage extends StatelessWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Focus.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Productos CRUD'),
          centerTitle: true,
          backgroundColor: ConstColors.appBar,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: ConstColors.background,
          ),
          child: Container(
            margin: EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.white,
              boxShadow: CustomShadows.getContainerShadow(),
            ),
          ),
        ),
      ),
    );
  }
}
