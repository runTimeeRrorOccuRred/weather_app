import 'package:flutter/material.dart';

import 'home.dart';
void main()
{
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
      // primarySwatch: Colors.amber,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          color: Colors.indigoAccent, //<-- SEE HERE
        ),
      ),
      debugShowCheckedModeBanner: false,
      home:  Home(),
    );
  }
}
