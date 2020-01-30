import 'package:flutter/material.dart';
import 'package:flutter_login/ui/ViewList.dart';
import 'ui/LoginPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List with login',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: {
        '/login':(context) => LoginPage(),
        '/list':(context) => ViewList()
      },
    );
  }
}
