import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: size.height / 20,
          ),
          Container(
              width: size.width / 1.2,
              alignment: Alignment.centerLeft,
              child: IconButton(
                  onPressed: () {}, icon: Icon(Icons.arrow_back_ios))),
          Container(
            width: size.width / 1.3,
            child: Text(
              "Welcome",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: size.width / 1.3,
            child: Text(
              "Sign In to continue !",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 23,
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: size.height / 10,
          ),
          Container(
              width: size.width / 1.3,
              alignment: Alignment.center,
              child: field(size, "email", Icons.account_box)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18),
            child: field(size, "password", Icons.lock),
          ),
          SizedBox(
            height: size.height / 10,
          ),
          customButton(size)
        ],
      ),
    );
  }

  Widget customButton(Size size) {
    return Container(
      height: size.height / 14,
      width: size.width / 1.3,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.blue),
      alignment: Alignment.center,
      child: Text(
        "Login",
        style: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget field(Size size, String hint, IconData icon) {
    return Container(
      height: size.height / 15,
      width: size.width / 1.3,
      child: TextField(
        decoration: InputDecoration(
            prefixIcon: Icon(icon),
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
