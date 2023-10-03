import 'package:appquiz/pages/Home.dart';
import 'package:appquiz/pages/connect.dart';
import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Login> {
  final email = TextEditingController();
  final Password = TextEditingController();
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Login"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller:email,
              decoration: InputDecoration(
                hintText: "Email"
              ),
            ),
            TextFormField(
              controller: Password,
              decoration: InputDecoration(
                hintText: "Password"
              ),
            ),
            IconButton(onPressed: createitem, icon: Icon(Icons.abc))
          ],
        ),
      ),
    );
  }

  Future<void> createitem() async {
    final pb = PocketBase('http://127.0.0.1:8090');
    await pb.admins.authWithPassword(email.text, Password.text);
    if (pb.authStore.isValid) {
      load();
      navi();
    }
  }
  
  void navi() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MyHomePage(title: "Home Page")));
  }
}
