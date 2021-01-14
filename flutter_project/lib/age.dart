import 'package:Shrine/sex.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'sex.dart';
import 'alergy.dart';
class SurveyAge extends StatelessWidget {
  final _userAgeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
String name =Provider.of<String>(context);
Firebase.initializeApp();
    DocumentReference user = FirebaseFirestore.instance.collection('user').doc(FirebaseAuth.instance.currentUser.uid);
    return MaterialApp(
        home: Scaffold(
          resizeToAvoidBottomPadding: false,

          backgroundColor: HexColor("FFFDFB"),
          body: Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 50),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '기본정보',
                        style: TextStyle(color: HexColor("FE8749")),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: HexColor("FE8749"),
                      ),
                      Text('체질'),
                      Icon(Icons.arrow_forward_ios),
                      Text('증상/불편'),
                      Icon(Icons.arrow_forward_ios),
                      Text('라이프스타일'),
                      Icon(Icons.arrow_forward_ios),
                      Text('기타'),
                    ],
                  ),
                ),
                SizedBox(
                  height: 90,
                ),
                Text(name +'님은 몇 살이신가요?',
                    style: TextStyle(
                        fontFamily: 'NotoSans',
                        fontSize: 18,
                        fontWeight: FontWeight.w200)),
                SizedBox(
                  height: 50,
                ),
                Container(
                    width: 300,
                    child: TextField(

                        controller: _userAgeController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '나이'))),
                SizedBox(
                  height: 40,
                ),
                ButtonBar(
                  buttonHeight: 50,
                  buttonMinWidth: 120,
                  alignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                        textColor: HexColor("977F72"),
                        color: HexColor("FFFDFB"),
                        onPressed: () {
                          Navigator.pop(
                            context,
                          );
                        },
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                            side: BorderSide(color: HexColor("977F72"))),
                        child: Text(
                          '이전',
                          style: TextStyle(fontSize: 20),
                        )),
                    SizedBox(width: 25,),
                    ButtonTheme(
                        height: 50,
                        minWidth: 200,
                        child: RaisedButton(
                            textColor: Colors.white,
                            color: HexColor("977F72"),
                            onPressed: () {
                              user.update({'age': _userAgeController.text});
                              Navigator.push(
                                context,
                                MaterialPageRoute(

                                    builder: (BuildContext context) {
                                      //프로바이더 사용하여 사용자의 이름을 전역변수처럼 사용
                                      return Provider<String>.value(
                                          value:name,
                                          child:SurveyAlergy());
                                    }
                                ),
                              );
                            },
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                                side: BorderSide(color: Colors.white)),
                            child: Text(
                              '다음',
                              style: TextStyle(fontSize: 20),
                            )))
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
