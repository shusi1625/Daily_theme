import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';

//일단 로그아웃 구현을 위해 앱바만 만들었습니다.

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final _authentication = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daily Theme"),
        actions: [
          IconButton(onPressed: () {
            _authentication.signOut();
            Navigator.push(context,
                MaterialPageRoute(
                    builder: (context) {
                      return Login();
                    }));
          }, icon: Icon(Icons.logout))
        ],
      ),
    );
  }
}
