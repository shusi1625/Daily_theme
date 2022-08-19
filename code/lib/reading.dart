import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/intl.dart';
import 'main.dart';


enum Set {
  time, like, subscribe
}

var set = Set.subscribe;

class Reading extends StatefulWidget {
  const Reading({Key? key}) : super(key: key);

  @override
  State<Reading> createState() => _ReadingState();
}

class _ReadingState extends State<Reading> {
  @override
  Widget build(BuildContext context) {
    set=Set.subscribe;
    return Scaffold(
      appBar: AppBar(
        title: Text('this is the test'),
      ),
      body: StreamBuilder(
        stream: (set == Set.time) ? FirebaseFirestore.instance
            .collection('data').orderBy('time')
            .snapshots() : (set == Set.like) ? FirebaseFirestore.instance
            .collection('data').orderBy('like')
            .snapshots() : FirebaseFirestore.instance
            .collection('data').where('username', whereIn: following)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot){
          if(snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final count = snapshot.data!.docs;
          return ListView.builder(
              itemCount: count.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Box(
                        count[index]['username'],
                        count[index]['text'],
                        count[index]['like'],
                    ),
                  SizedBox(height: 30,)
                  ],
                );
          },
          );
        },
      ),
    );
  }
}


//Box를 통해 글이 출력됩니다.
class Box extends StatelessWidget {
  const Box(this.user, this.content, this. like, {Key? key}) : super(key: key);

  final String content;
  final String user;
  final int like;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 20,),
        Container(
            child: Column(
              children: [
                Text(user),
                Text(content),
                Row(
                  children: [
                    IconButton(onPressed: () {

                    }, icon: Icon(Icons.favorite_border)),
                    Text('$like'),
                  ],
                )
              ],
            ),
          ),
      ],
    );
  }
}

class Box2 extends StatelessWidget {
  const Box2(this.user, this.content, this. like, {Key? key}) : super(key: key);

  final String content;
  final String user;
  final int like;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 20,),
        Container(
          child: Column(
            children: [
              Text(user),
              Text(content),
              Row(
                children: [
                  IconButton(onPressed: () {

                  }, icon: Icon(Icons.favorite)),
                  Text('$like'),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

