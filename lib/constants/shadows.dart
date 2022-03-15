import 'package:flutter/material.dart';

class CustomShadows {
  static List<BoxShadow> getContainerShadow() {
    return [
      BoxShadow(
        color: Colors.black12,
        offset: Offset(0, 4),
        blurRadius: 10.0,
      ),
    ];
  }
}
