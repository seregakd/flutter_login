import 'package:flutter/material.dart';
import 'utils.dart';
import 'users.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _emailFilter = TextEditingController();
  final _passwordFilter = TextEditingController();
  String _email = "";
  String _password = "";
  var _utils = Utils();

  _LoginPageState() {
    _emailFilter.addListener(_emailListen);
    _passwordFilter.addListener(_passwordListen);
  }

  void _emailListen() {
    _email = _emailFilter.text;
  }

  void _passwordListen() {
    _password = _passwordFilter.text;
  }

  @override
  void dispose() {
    _emailFilter.dispose();
    _passwordFilter.dispose();
    super.dispose();
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
                labelText: 'Email',
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
      return _utils.viewShowDialog(context, 'Username not exists');
    }

    if (users[_email] != _password) {
      return _utils.viewShowDialog(context, 'Password does not match');
    }

    Navigator.pushReplacementNamed(context, '/list');
  }
}