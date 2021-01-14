import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:Shrine/app.dart';
import 'login.dart';
import 'app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ShrineApp());
}