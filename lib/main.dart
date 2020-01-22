import 'package:flutter/material.dart';
import 'package:flutter_login/view_list.dart';
import 'users.dart';

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

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _emailFilter = new TextEditingController();
  final TextEditingController _passwordFilter = new TextEditingController();
  String _email = "";
  String _password = "";

  _LoginPageState() {
    _emailFilter.addListener(_emailListen);
    _passwordFilter.addListener(_passwordListen);
  }

  void _emailListen() {
    if (_emailFilter.text.isEmpty) {
      _email = "";
    } else {
      _email = _emailFilter.text;
    }
  }

  void _passwordListen() {
    if (_passwordFilter.text.isEmpty) {
      _password = "";
    } else {
      _password = _passwordFilter.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _buildBar(context),
      body: new Container(
        padding: EdgeInsets.all(16.0),
        child: new Column(
          children: <Widget>[
            _buildTextFields(),
            new RaisedButton(
              child: new Text('Login'),
              onPressed: _loginPressed,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      title: new Text("List with login"),
      centerTitle: true,
    );
  }

  Widget _buildTextFields() {
    return new Container(
      child: new Column(
        children: <Widget>[
          new Container(
            child: new TextField(
              controller: _emailFilter,
              decoration: new InputDecoration(
                  labelText: 'Email'
              ),
            ),
          ),
          new Container(
            child: new TextField(
              controller: _passwordFilter,
              decoration: new InputDecoration(
                  labelText: 'Password'
              ),
              obscureText: true,
            ),
          )
        ],
      ),
    );
  }

  void _loginPressed () {
    if (!users.containsKey(_email)) {
      _viewShowDialog('Username not exists');
    } else {
      if(users[_email] != _password) {
        _viewShowDialog('Password does not match');
      } else {
        Navigator.pushReplacementNamed(context, '/list');
      }
    }
  }

  void _viewShowDialog(String errorMessage){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: ListTile(
          title: Text("Error!"),
          subtitle: Text(errorMessage),
        ),
        actions: <Widget>[
          FlatButton(
            color: Colors.amber,
            child: Text('Ok'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }


}