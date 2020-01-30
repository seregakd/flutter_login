import 'package:flutter/material.dart';
import 'package:flutter_login/ui/view_list.dart';
import 'ui/login_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
