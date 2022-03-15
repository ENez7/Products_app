import 'package:flutter/material.dart';
import 'package:ecommerce_platform/pages/home.page.dart';

import '../pages/form.page.dart';

class Rutas {
  static final paginas = <String, WidgetBuilder>{
    '/': (context) => const HomePage(),
    '/form': (context) => const FormPage(),
  };
}
