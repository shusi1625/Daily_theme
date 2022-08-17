import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          return '잘못된 이메일 형식입니다.';
                        } else {
                          return null;
                        }
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
                          return '8자 이상, 25자 이하로 입력해주세요.';
                        } else {
                          return null;
                        }
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
                            onPressed: null),
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
                            onPressed: (){
                        final isValid = formKey.currentState!.validate();
                        if(isValid) {
                          print('5');
                        }
                            }),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          return '10자 이내로 입력해주세요.';
                        } else {
                          return null;
                        }
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
                          return '잘못된 이메일 형식입니다.';
                        } else {
                          return null;
                        }
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
                          return '8자 이상, 25자 이하로 입력해주세요.';
                        } else {
                          return null;
                        }
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
                        onPressed: (){
                          final isValid = formKey2.currentState!.validate();
                          if(isValid) {
                            print('5');
                          }
                        }),
                  ],
                ),
              ),)
            )
          ],
        ),
      ),
    );
  }
}
