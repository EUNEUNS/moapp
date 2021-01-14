import 'package:Shrine/sex.dart';
import 'package:Shrine/symtom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class SurveyPhysic extends StatefulWidget {

  _SurveyPhysicState createState() => _SurveyPhysicState();
}

class _SurveyPhysicState extends State<SurveyPhysic> {
  File _image;
  final picker = ImagePicker();

  Future uploadImage(BuildContext context) async {
    //firebase storage
    String fileName = basename('physicPic'+FirebaseAuth.instance.currentUser.uid);
    Reference firebaseStorageRef =
    FirebaseStorage.instance.ref().child(fileName);

    UploadTask uploadTask = firebaseStorageRef.putFile(_image);

    TaskSnapshot taskSnapshot = await uploadTask;
    var _dowurl = await (await uploadTask).ref.getDownloadURL();
    final _url = _dowurl.toString();

    DocumentReference user = FirebaseFirestore.instance.collection('user').doc(
        FirebaseAuth.instance.currentUser.uid);
    user.update({'physicPhoto': _url});


    setState(() {
      print("Picture uploaded");
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Uploaded')));
    });
  }
  getGalleryImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }
  @override
  Widget build(BuildContext context) {
    String name = Provider.of<String>(context);
    Firebase.initializeApp();

    return MaterialApp(
      home: Scaffold(
          resizeToAvoidBottomPadding: false,

          backgroundColor: HexColor("FFFDFB"),
          body: Container(
              child: ListView(
                  children: <Widget>[
                  SizedBox(height: 50),
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
                    Text('체질',                      style: TextStyle(color: HexColor("FE8749")),
                    ),
                    Icon(Icons.arrow_forward_ios,
                      color: HexColor("FE8749"),
                    ),
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
              Text('다음은' + name + '님의 체질을 검사하려고 합니다.',
                  style: TextStyle(
                      fontFamily: 'NotoSans',
                      fontSize: 18,
                      fontWeight: FontWeight.w200)),
              Text('본인의 사진을 올려주시면 체질을 검사해드립니다.',
                  style: TextStyle(
                      fontFamily: 'NotoSans',
                      fontSize: 12,
                      fontWeight: FontWeight.w100)),

              _image == null ? Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSi258nr2WywsL8PAtGEHa2SKA74fGI4HhwyQ&usqp=CAU',
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
              height: 300,)
                  : Image.file(_image),

              Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(Icons.camera_alt),
                      onPressed: () => getGalleryImage(),
                    ),
                  ]),
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
                            uploadImage(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    //프로바이더 사용하여 사용자의 이름을 전역변수처럼 사용
                                    return Provider<String>.value(
                                        value:name,
                                        child:SurveySymtom());
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
                ]
              )

          ]),
    )));
  }
}
