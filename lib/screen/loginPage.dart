import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: _header(),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[_body()],
        ),
      ),
    );
  }

  Widget _body() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _loginLogo(0.1),
          _formField("Name"),
          _formField("Password"),
          _loginButton(),
          _forgetPassword()
        ],
      ),
    );
  }

  Widget _header() {
    return const Text("Login Page");
  }

  Widget _formField(String name) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        20,
        20,
        20,
        0,
      ),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(90.0),
          ),
          labelText: name,
        ),
      ),
    );
  }

  Widget _loginButton() {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.1,
      padding: const EdgeInsets.all(20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 255, 243, 227),
          foregroundColor: Colors.black,
          minimumSize:
              Size.fromHeight(MediaQuery.sizeOf(context).height * 0.01),
        ),
        child: const Text("Log In"),
        onPressed: () {},
      ),
    );
  }

  Widget _loginLogo(double size) {
    return Container(
        padding: const EdgeInsets.all(20),
        child: Icon(
          Icons.person_2_sharp,
          size: MediaQuery.sizeOf(context).height * size,
        ));
  }

  Widget _forgetPassword() {
    return TextButton(
      onPressed: () {},
      child: Text(
        "Forgot Password?",
        style: TextStyle(color: Colors.grey[600]),
      ),
    );
  }

  Widget _sizeBox(double height) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * height,
    );
  }
}
