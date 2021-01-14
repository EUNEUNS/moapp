import 'package:Shrine/physical.dart';
import 'package:Shrine/result.dart';
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
import 'lifestyle.dart';

class SurveySymtom extends StatefulWidget {
  _SurveySymtomState createState() => _SurveySymtomState();
}

class _SurveySymtomState extends State<SurveySymtom> {
  TextEditingController _userController = TextEditingController();
  int max_num = 3;
  int cnt = 0;
  Map<String, bool> List = {
    '체력 유지': false,
    '신경계 증상': false,
    '소화기계': false,
    '혈액순환': false,
    '다이어트': false,
    '근골격계': false,
    '숙취해소': false,
    '호흡기계': false,
  };

  @override
  Widget build(BuildContext context) {
    String name = Provider.of<String>(context);
    Firebase.initializeApp();
    DocumentReference user = FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser.uid);
    return MaterialApp(
        home: Scaffold(
      backgroundColor: HexColor("FFFDFB"),
      body:
      Builder(builder:(BuildContext abc){   // Scaffold.of(context)를 이용하면 해당 context의 Scaffold에 접근하여 스낵바를 출력할 수 있는데, 위 소스에서는 Scaffold의 Scaffold를 참조하는 형태이기 때문에 에러가 발생하는 것 같다.
        return Container(
          child: ListView(
              children: <Widget>[

              SizedBox(height: 20),
          Container(
          child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text(
          '기본정보',
        ),
        Icon(
        Icons.arrow_forward_ios,
        ),
        Text('체질'),
        Icon(Icons.arrow_forward_ios),
        Text(
        '증상/불편',
        style: TextStyle(color: HexColor("FE8749")),
        ),
        Icon(
        Icons.arrow_forward_ios,
        color: HexColor("FE8749"),
                  ),
                  Text('라이프스타일'),
                  Icon(Icons.arrow_forward_ios),
                  Text('기타'),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
            Text(name + '님이 불편하시거나 \n걱정되는 사안을 3가지 골라주세요.',
                style: TextStyle(
                    fontFamily: 'NotoSans',
                    fontSize: 18,
                    fontWeight: FontWeight.w200))]),
            SizedBox(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.only(left:20 ,right: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: HexColor('D3D3D3'))
                ),
              child: Column(
              children: List.keys.map((String key) {
                return new CheckboxListTile(
                  title: new Text(key),
                  value: List[key],
                  activeColor: HexColor("977F72"),
                  checkColor: Colors.white,
                  onChanged: (bool value) {
                    // 체크박스 선택 or 해제시
                    setState(() {
                      value == true    // 체크 시
                          ? cnt >= 3   //  3개 초과 시
                      ? {Scaffold.of(abc).showSnackBar(             //스낵바 띄우기
                          SnackBar(content: Text('3개까지만 선택해주세요.'))),
                      value=false}                                  // value값 false로 설정
                              : cnt = cnt + 1
                          : cnt = cnt - 1;
                      List[key] = value;
                    });
                  },
                );
              }).toList(),
              )),
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
                          int tmp = 0;
                          for (int i = 0; i < List.keys.length; i++) {
                            print(List.keys.toList()[i]);
                            if (List.values.toList()[i] == true) {
                              tmp++;
                              user.update({
                                'symtom' + tmp.toString(): List.keys.toList()[i]
                              });
                            }
                          }
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (BuildContext context) {
                              //프로바이더 사용하여 사용자의 이름을 전역변수처럼 사용
                              return Provider<String>.value(
                                  value: name, child: SurveyLifeStyle());
                            }),
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
      );
  })));
  }
}
