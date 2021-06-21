import 'package:chat/Methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _search = TextEditingController();
  bool isloading = false;
  late Map<String, dynamic> user;
  void onSearch() async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    setState(() {
      isloading = true;
    });
    await _firestore
        .collection('users')
        .where("email", isEqualTo: _search.text)
        .get()
        .then((value) {
      setState(() {
        user = value.docs[0].data();
        isloading = false;
      });
      print(user);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("OUR chat"),
        actions: [
          IconButton(onPressed: () => logOut(context), icon: Icon(Icons.logout))
        ],
      ),
      body: isloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                SizedBox(height: size.height / 20),
                Container(
                  height: size.height / 14,
                  width: size.width,
                  alignment: Alignment.center,
                  child: Container(
                    height: size.height / 14,
                    width: size.width / 1.3,
                    child: TextField(
                      controller: _search,
                      decoration: InputDecoration(
                          hintText: "search",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height / 90,
                ),
                ElevatedButton(onPressed: onSearch, child: Text("search")),
                user != null
                    ? ListTile(
                        title: Text(user["name"]),
                        subtitle: Text(user["email"]),
                        onTap: () {},
                      )
                    : Container()
              ],
            ),
    );
  }
}
