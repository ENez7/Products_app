import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Productos',
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: Rutas.paginas,
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}
