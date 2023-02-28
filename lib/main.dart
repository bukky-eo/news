import 'package:flutter/material.dart';
import 'package:news/screens/homepage.dart';
import 'package:news/screens/intro.dart';

void main() {
  runApp(const News());
}

class News extends StatelessWidget {
  const News({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
    );
  }
}
