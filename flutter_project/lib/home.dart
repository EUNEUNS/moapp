import 'package:Shrine/name.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: HexColor("584840"),
        body: Container(
            child:Center(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                SizedBox(height: 220),
                Text('첩첩박사님!', style: TextStyle(fontFamily: 'NotoSans',fontSize: 25,fontWeight: FontWeight.w600, color: Colors.white)),
                Text('제 건강을 알려주세요!', style: TextStyle(fontFamily: 'NotoSans',fontSize: 25,fontWeight: FontWeight.w300, color: Colors.white)),
                SizedBox(height: 30),
                Text('몇 가지 질문에 답하고 \n나에게 필요한 한방차를 알아보세요.\n\n약 3분정도 소요됩니다.', style: TextStyle(fontFamily: 'NotoSans',fontSize: 15,fontWeight: FontWeight.w100, color: Colors.white)),
                SizedBox(height: 120,),
                ButtonTheme(
                    height: 50,minWidth: 200,
                    child:RaisedButton(

                        textColor: Colors.white,
                        color: HexColor("584840"),
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => SurveyName(),
                            ),
                          );
                        },
                        shape: new RoundedRectangleBorder( borderRadius: new BorderRadius.circular(30.0), side: BorderSide(color: Colors.white)),
                        child:
                        Text('지금 시작하기',style: TextStyle(fontSize: 20),))

                )

              ] ,
            )
            )
        ),
      ),
    );

  }
}
