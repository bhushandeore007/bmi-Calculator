import 'package:flutter/material.dart';
import 'input_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xff0a0e21),
          ),
          scaffoldBackgroundColor: const Color(0xff0a0e21),
          textTheme: const TextTheme(
            bodyText1: TextStyle(color: Colors.white),
          )),
      home: InputPage(),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
