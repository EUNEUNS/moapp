import 'package:Shrine/name.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

class Result extends StatefulWidget {
  _ResultState createState() => _ResultState();
}

Map<String, String> suggestion = {
  '체력 유지':'기운 든든 차',
  '신경계 증상':'손발 따뜻 차',
  '소화기계': '체력 든든 차',
  '혈액순환': '가벼운 차',
  '다이어트': '가슴진정 차',
  '근골격계': '십전대보탕',
  '숙취해소': '마음든든 차',
  '호흡기계': '위장튼튼 차',
};
class _ResultState extends State<Result> {
  String symtom1;

  @override
  Widget build(BuildContext context) {
    String name = Provider.of<String>(context);
    //사용자의 증상 목록 가져오기
      FirebaseFirestore.instance
          .collection('user')
          .doc(FirebaseAuth.instance.currentUser.uid)
          .get()
          .then((DocumentSnapshot ds) {
        symtom1 = ds['symtom1'];
      });



    return MaterialApp(
        home: Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: HexColor("FFFDFB"),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 70),
            Text(name + '님\n 한방차 설문 결과를 받아보세요.',
                style: TextStyle(
                    fontFamily: 'NotoSans',
                    fontSize: 20,
                    fontWeight: FontWeight.w400)),
            SizedBox(
              height: 30,
            ),
            Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: HexColor('D3D3D3'))),
                padding: EdgeInsets.all(15),
                width: 350,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          '몸에 열이 많아 스트레스성으로 \n소화가 잘 되지 않거나 가슴 쪽에 \n갑갑한 경우가 있습니다.',
                          style: TextStyle(
                              fontFamily: 'NotoSans',
                              fontSize: 14,
                              color: HexColor('828181'),
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Text(
                          '배변활동을 돕는 유익균으로 장내 좋은 환경 유지가 필요해요\n유해산소로부터 세포 보호와 피부 등 결합조직 관리가 필요해요',
                          style: TextStyle(
                              fontFamily: 'NotoSans',
                              fontSize: 12,
                              color: HexColor('977F72'),
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 30),
                      Text(suggestion[symtom1],
                          style: TextStyle(
                              fontFamily: 'NotoSans',
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            child: Image.network(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3-9hhmI7ksVrLN6tAFlZGk4SqBaJ0g-GmUg&usqp=CAU',
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Wrap(
                            children:[
                          Text('다소 마른 체격에 꼼꼼한 성격의\n 여성들에게 이런 경우가 많은데.\n마음이 편치 않으며 가슴이 \n두근두근하고. 깊이 잠들기가\n어려울 때 마음을 진정시키고\n잠을 잘 잘 수 있도록 도움',style: TextStyle(
                                  fontFamily: 'NotoSans',
                                  fontSize: 12,
                                  color: HexColor('FF7070'),
                                  fontWeight: FontWeight.bold)),
                          ])
                        ],
                      )
                    ])),
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
                SizedBox(
                  width: 25,
                ),
                ButtonTheme(
                    height: 50,
                    minWidth: 200,
                    child: RaisedButton(
                        textColor: Colors.white,
                        color: HexColor("977F72"),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (BuildContext context) {
                              //프로바이더 사용하여 사용자의 이름을 전역변수처럼 사용
                              return Provider<String>.value(
                                  value: name, child: SurveyName());
                            }),
                          );
                        },
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                            side: BorderSide(color: Colors.white)),
                        child: Text(
                          '다시하기',
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
