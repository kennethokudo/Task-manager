import 'package:flutter/material.dart';
import 'package:flutter_application_6/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xffede7dc),
      ),
    );
  }
}
