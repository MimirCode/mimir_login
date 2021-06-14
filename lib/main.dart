import 'package:flutter/material.dart';
import 'package:mimir_login/pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mimir Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimatedLoginPage(),
    );
  }
}
