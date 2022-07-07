import 'package:flutter/material.dart';
import 'package:pipocando/core/constant.dart';
import 'core/constant.dart';
import 'core/theme_app.dart';
import 'pages/movie_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: kAppName,
      theme: kThemeApp,
      home: MoviePage(),
    );
  }
}