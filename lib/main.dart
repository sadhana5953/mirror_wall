import 'package:flutter/material.dart';
import 'package:mirror_wall/View/HomeScreen.dart';
import 'package:mirror_wall/View/searchDataScreen.dart';

void main()
{
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
