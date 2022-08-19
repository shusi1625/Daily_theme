import 'package:daily_theme/main.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'reading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class writing extends StatefulWidget {
  const writing({Key? key}) : super(key: key);

  @override
  State<writing> createState() => _writingState();
}

class _writingState extends State<writing> {

  var _Enter = '';
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(child: TextField(
              controller: _controller,
              onChanged: (value) {
                setState(() {
                  _Enter = value;
                });
              },
            )
            ),
            ElevatedButton(onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) {
                        return Reading();
                      }
                  ));
            }, child: Text("읽기로 이동 (임시)")),
            ElevatedButton(
                onPressed: () {
                    FocusScope.of(context).unfocus();
                    if(_Enter.length != 0 && _Enter != null) {
                      _controller.clear();
                    FirebaseFirestore.instance.collection('data').add(
                    { 'username' : username,
                      'time' : Timestamp.now(),
                      'text' : _Enter,
                      'like' : 0
                    }
                    );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: Duration(seconds: 1),
                            content: Text(
                              '업로드에 실패했습니다. 다시 한 번 확인해주세요.',),
                            backgroundColor: Colors.orange,
                          ));
                    }
                },
                child: Text("Send")

            )
          ],
        ),
      ),
    );
  }
}
