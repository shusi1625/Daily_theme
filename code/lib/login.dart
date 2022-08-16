import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
            Form(child: Theme(
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
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Email Address'
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 30,),
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'Password'
                      ),
                      keyboardType: TextInputType.emailAddress,
                      obscureText: true,
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
                            onPressed: (){print("5");}),
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
                          onPressed: (){print("5");},)
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
