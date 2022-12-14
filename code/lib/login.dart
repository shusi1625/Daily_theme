import 'package:daily_theme/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _authentication = FirebaseAuth.instance;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  String userEmail = '';
  String userPW = '';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Color(0xffD8A575),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 30)),
              Center(
                child: Image(image: AssetImage('image/icon1.png'),),

              ),
              Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Theme(
                data: ThemeData(
                  primaryColor: Colors.white,
                  inputDecorationTheme: InputDecorationTheme(
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                    )
                  )
                ),
                child: Container(
                  padding: EdgeInsets.all(45),
                  child: Column(
                    children: [
                      TextFormField(
                        key: ValueKey(1),
                        decoration: InputDecoration(
                          labelText: 'Email Address'
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if((value != null && !value.contains('@') && value.length != 0)||value==null) {
                            return '????????? ????????? ???????????????.';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value){
                          userEmail = value;
                        },
                      ),
                      SizedBox(height: 30,),
                      TextFormField(
                        key: ValueKey(2),
                        decoration: InputDecoration(
                            labelText: 'Password',
                          hintText: '8~25 characters'
                        ),
                        keyboardType: TextInputType.emailAddress,
                        obscureText: true,
                        validator: (value) {
                          if((value != null && (value.length < 8 || value.length>25) && value.length != 0) ||value==null) {
                            return '8??? ??????, 25??? ????????? ??????????????????.';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          userPW = value;
                        },
                      ),
                      Row(
                        children: [
                          SizedBox(width: 232,),
                          TextButton(
                              child: Text('Forgot PW?',
                              style: TextStyle(
                                fontSize: 14,
                                  color: Colors.black45
                              ),),
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(
                                        builder: (context) {
                                          return FindMyPW();
                                        }));
                              }),
                        ],
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xffD8AD7C)
                        ),
                            child: Text('           Login           ',
                            style: TextStyle(
                              color: Colors.white70
                            ),),
                              onPressed: ()async{
                          final isValid = formKey.currentState!.validate();

                          if(isValid) {
                            try{
                            final newUser = await _authentication.signInWithEmailAndPassword(
                                email: userEmail, password: userPW);
                            FirebaseFirestore.instance.collection('user').doc(FirebaseAuth.instance.currentUser!.uid)
                                .get().then((value) => username = value["username"]);

                            if(newUser.user != null) {
                            Navigator.push(context,
                                MaterialPageRoute(
                                    builder: (context) {
                                      return Homepage();
                                      }));
                          }}catch(e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  duration: Duration(seconds: 1),
                                  content: Text(
                                  '???????????? ??????????????????. ?????? ??? ??? ??????????????????.',),
                                  backgroundColor: Colors.orange,
                                ));
                          }}
    }
    ),
                    SizedBox(height: 80),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Why don't you join us?"),
                        TextButton(
                            child: Text('Sign up',
                            style: TextStyle(
                              color: Colors.black45
                            ),),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return SignUp();
                                  }));},)
                      ],
                    )
                    ],
                  ),
                ),)
              )
            ],
          ),
        ),
      ),
    );
  }
}


class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey2 = GlobalKey<FormState>();
  String signName = '';
  String signEmail = '';
  String signPW = '';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Color(0xffD8A575),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 20)),
              Center(
                child: Image(image: AssetImage('image/icon1.png'),),

              ),
              Form(
                  key: formKey2,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Theme(
                data: ThemeData(
                    primaryColor: Colors.white,
                    inputDecorationTheme: InputDecorationTheme(
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        )
                    )
                ),
                child: Container(
                  padding: EdgeInsets.all(45),
                  child: Column(
                    children: [
                      TextFormField(
                        key: ValueKey(3),
                        decoration: InputDecoration(
                            labelText: 'User Name'
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if((value != null && (value.length>10) && value.length != 0) ||value==null) {
                            return '10??? ????????? ??????????????????.';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value){
                          signName = value;
                        },
                      ),
                      SizedBox(height: 30,),
                      TextFormField(
                        key: ValueKey(4),
                        decoration: InputDecoration(
                            labelText: 'Email Address'
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if((value != null && !value.contains('@') && value.length != 0)||value==null) {
                            return '????????? ????????? ???????????????.';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value){
                          signEmail = value;
                        },
                      ),
                      SizedBox(height: 30,),
                      TextFormField(
                        key: ValueKey(5),
                        decoration: InputDecoration(
                            labelText: 'Password',
                          hintText: '8~25 characters'
                        ),
                        keyboardType: TextInputType.emailAddress,
                        obscureText: true,
                        validator: (value) {
                          if((value != null && (value.length < 8 || value.length>25) && value.length != 0) ||value==null) {
                            return '8??? ??????, 25??? ????????? ??????????????????.';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value){
                          signPW = value;
                        },
                      ),
                      SizedBox(height: 60),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xffD8AD7C)
                          ),
                          child: Text('           Sign up           ',
                            style: TextStyle(
                                color: Colors.white70
                            ),),
                          onPressed: ()async{
                            final isValid = formKey2.currentState!.validate();
                            if(isValid) {
                              try{
                              final newUser = await _authentication.createUserWithEmailAndPassword(
                                  email: signEmail, password: signPW);
                              FirebaseFirestore.instance.collection('user').doc(newUser.user!.uid)
                              .set(
                                {'username' : signName
                                , 'email' : signEmail}
                              );
                              FirebaseFirestore.instance.collection('user').doc(newUser.user!.uid)
                                  .get().then((value) => username = value["username"]);
                              FirebaseFirestore.instance.collection('user/${newUser.user!.uid}/following').doc(newUser.user!.uid)
                                  .get().then((value) => following = value["following"]);
                              print(following);
                              if(newUser.user != null) {
                                Navigator.push(context,
                                MaterialPageRoute(
                                    builder: (context) {
                                      return Homepage();
                                    }
                                ));
                              }
                            }catch(e){
                                print(e);
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      duration: Duration(seconds: 1),
                                      content: Text(
                                      '??????????????? ??????????????????. ?????? ??? ??? ??????????????????.',),
                                      backgroundColor: Colors.orange,
                                    ));        }
                          }}),
                    ],
                  ),
                ),)
              )
            ],
          ),
        ),
      ),
    );
  }
}


class FindMyPW extends StatefulWidget {
  const FindMyPW({Key? key}) : super(key: key);

  @override
  State<FindMyPW> createState() => _FindMyPWState();
}

class _FindMyPWState extends State<FindMyPW> {
  String emailForNew = '';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
        backgroundColor: Color(0xffD8A575),
    body: SingleChildScrollView(
    child: Column(
    children: [
    Padding(padding: EdgeInsets.only(top: 20)),
    Center(
    child: Image(image: AssetImage('image/icon1.png'),),

    ),

      SizedBox(height: 30,),
      
      Container(
        padding: EdgeInsets.all(45),
        child: TextFormField(
          key: ValueKey(6),
          decoration: InputDecoration(
            labelText: 'Email Address',
        ),
          onChanged: (value){
            emailForNew = value;
          },
        ),
      ),
      SizedBox(height: 15),
      ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Color(0xffD8AD7C)
          ),
          child: Text('           Send Email           ',
            style: TextStyle(
                color: Colors.white70
            ),),
          onPressed: ()async{
              try{
                await FirebaseAuth.instance
                    .sendPasswordResetEmail(email: emailForNew);;
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) {
                            return Login();
                          }
                      ));
              }catch(e){
                print(e);
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: Duration(seconds: 1),
                      content: Text(
                        '????????? ????????? ??????????????????. ?????? ??? ??? ??????????????????.',),
                      backgroundColor: Colors.orange,
                    ));        }
            }),
    ]))));
  }
}
