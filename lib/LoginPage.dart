import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';
import 'dart:core';
import 'dart:convert';
import 'package:http/http.dart' as http;

final String URL = "http://68.183.205.184/index.php";

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _emailController;
  late TextEditingController _nameController;
  late TextEditingController _passwordController;

  int i = 0;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _nameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
//String ecg_data, String bpm_data, String ir_value, String red_value
  Future<void> _attemptLogin(String name, String password, String email, ) async {
    try {
      final response = await http.post(
        Uri.parse(URL),
        //'ecg_data': ecg_data, 'bpm_data': bpm_data, 'ir_value': ir_value, 'red_value': red_value
        body: {'username': name, 'password': password, 'email': email },
      );

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        if (result != null) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(result['message'])));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Unable to retrieve any data from server")));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Error: ${response.statusCode}")));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error: $e")));
    }
  }

  void _onSignInButtonPressed() async {
    await _attemptLogin(_nameController.text, _passwordController.text, "");
  }

  void _onRegisterButtonPressed() async {
    if (i == 0) {
      setState(() {
        i = 1;
      });
    } else {
      setState(() {
        i = 0;
      });

      await _attemptLogin(_nameController.text, _passwordController.text,
          _emailController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Enter Name',
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: 'Enter Password',
              ),
            ),
            Visibility(
              visible: i == 1,
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Enter Email',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _onSignInButtonPressed,
              child: Text("Sign In"),
            ),
            ElevatedButton(
              onPressed: _onRegisterButtonPressed,
              child: Text(i == 0 ? "Register" : "CREATE ACCOUNT"),
            ),
          ],
        ),
      ),
    );
  }
}
