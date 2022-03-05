import 'package:ecommerce_platform/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'textfields/searchbar_tf.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context).size;
    final _textController = TextEditingController();

    return Center(
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 10.0,
          top: 20.0,
        ),
        width: _mediaQuery.width * 0.9,
        height: 36.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(
            //     left: 10.0,
            //   ),
            //   child: TextFormField(
            //     decoration: InputDecoration(
            //       hintText: 'HOlabola',
            //       labelText: 'LAS',
            //     ),
            //   ),
            // ),
            SizedBox(
              width: _mediaQuery.width * 0.7,
              child: CustomTF(
                controller: _textController,
                hintText: 'Buscar por nombre o ID',
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: Icon(Icons.search),
              style: ElevatedButton.styleFrom(
                primary: ConstColors.buttons,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
