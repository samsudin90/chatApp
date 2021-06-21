import 'package:chat/Methods.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TextButton(
            onPressed: () {
              logOut();
            },
            child: Text("Logout")));
  }
}
