import 'package:pipocando/widgets/auth_check.dart';

import 'core/constant.dart';
import 'core/theme_app.dart';
import 'pages/movie_page.dart';
import 'package:pipocando/core/constant.dart';
import 'package:pipocando/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(
    MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AuthService()),
      //ChangeNotifierProvider(
        //create: (context) => MovieRepository(
          //auth: context.read<AuthService>(),
        //),
      //),
    ],
    child: MyApp(),
  ),
  );

      //MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: kAppName,
      theme: kThemeApp,
      home: AuthCheck(),
    );
  }
}