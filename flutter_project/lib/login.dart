import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'home.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(375, 812), allowFontScaling: false);
    return MaterialApp(
        home:Scaffold(
      body: Builder(
        builder: (context)=> ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 70.0),
            Column(
              children: <Widget>[
                Container(
                  width: 250,
                  height: 250,
                  child: Image.asset('doctor.png',
                ),
                ),
                SizedBox(height: 20.0),
                Text('내 몸에 맞는 한방차 추천 서비스', style: TextStyle(fontSize: 20),),
                Text('첩첩박사', style: TextStyle(fontSize: 30),),
              ],
            ),
            SizedBox(height: 60.0),

//구글 로그인

                RaisedButton(
                    child: Text("구글 계정으로 로그인하기",style: TextStyle(fontSize: 18),),
                    onPressed:()
                    {
                      signInWithGoogle();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => HomePage(),
                        ),
                      );
                    }
                ),
            SizedBox(
                height: 12.0),

//익명 로그인
                RaisedButton(
                    child: Text("로그인 없이 이용하기",style: TextStyle(fontSize: 18)),
                    onPressed:(){
                      signAnonymous();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => HomePage(),
                        ),
                      );
                    }
                )
            
          ]
          ,


        )

        ,

      )

      ,

    ));
  }
}


void signAnonymous() async {
  UserCredential userCredential = await FirebaseAuth.instance
      .signInAnonymously();
}

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  // Create a new credential
  final GoogleAuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}


