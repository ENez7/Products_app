import 'package:ecommerce_platform/constants/shadows.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../models/product.dart';

class FormPage extends StatefulWidget {
  Product? product;
  FormPage({Key? key, this.product}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  TextEditingController productNameController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productStockController = TextEditingController();
  TextEditingController productImgController = TextEditingController();
  bool exists = false;
  @override
  void initState() {
    super.initState();
    productNameController.text = widget.product?.productName ?? '';
    productDescriptionController.text =
        widget.product?.productDescription ?? '';
    productPriceController.text = widget.product?.productPrice.toString() ?? '';
    productStockController.text = widget.product?.quantity.toString() ?? '';
    productImgController.text = widget.product?.productImage ?? '';
    if (productNameController.text != '') exists = true;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Productos CRUD'),
          centerTitle: true,
          backgroundColor: ConstColors.appBar,
        ),
        body: Container(
          height: size.height,
          width: size.width,
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
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: 24),
                  Text(
                    'Formulario',
                    style: TextStyle(fontSize: 34.0),
                  ),
                  CustomTFF(
                    controller: productNameController,
                    hintText: 'Nombre del producto',
                  ),
                  CustomTFF(
                    controller: productDescriptionController,
                    hintText: 'Descripción',
                  ),
                  CustomTFF(
                    controller: productPriceController,
                    hintText: 'Precio',
                  ),
                  CustomTFF(
                    controller: productStockController,
                    hintText: 'Stock',
                  ),
                  CustomTFF(
                    controller: productImgController,
                    hintText: 'Link de la imagen',
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton.extended(
              heroTag: 'btn1',
              onPressed: () {
                Navigator.of(context).pop();
              },
              label: Text('Cancelar'),
              backgroundColor: Colors.red,
            ),
            SizedBox(
              height: 20.0,
            ),
            FloatingActionButton.extended(
              heroTag: 'btn2',
              onPressed: () {
                // Add logic of post
                Navigator.of(context).pop();
              },
              label: exists ? Text('Actualizar') : Text('Guardar'),
              backgroundColor: ConstColors.appBar,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTFF extends StatelessWidget {
  const CustomTFF({
    Key? key,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 24,
        horizontal: 24,
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: ConstColors.appBar,
            ),
          ),
        ),
      ),
    );
  }
}
