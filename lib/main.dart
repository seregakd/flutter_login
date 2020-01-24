import 'package:flutter/material.dart';
import 'package:flutter_login/view_list.dart';
import 'login_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'List with login',
      theme: new ThemeData(
          primarySwatch: Colors.blue
      ),
      debugShowCheckedModeBanner: false,
      home: new LoginPage(),
      routes: {
        '/login':(context) => LoginPage(),
        '/list':(context) => ViewList()
      },
    );
  }
}
