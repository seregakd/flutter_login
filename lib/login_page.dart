import 'package:flutter/material.dart';
import 'utils.dart';
import 'users.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var _utils = Utils();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
              controller: _emailController,
              decoration: new InputDecoration(
                labelText: 'Email',
              ),
            ),
          ),
          new Container(
            child: new TextField(
              controller: _passwordController,
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

    if (!users.containsKey(_emailController.text)) {
      return _utils.viewShowDialog(context, 'Username not exists');
    }

    if (users[_emailController.text] != _passwordController.text) {
      return _utils.viewShowDialog(context, 'Password does not match');
    }

    Navigator.pushReplacementNamed(context, '/list');
  }
}