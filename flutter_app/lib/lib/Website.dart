import 'package:flutter/material.dart';
import 'dart:io';
import 'package:webview_flutter/webview_flutter.dart';
import 'home.dart';

class Website extends StatefulWidget {
  @override
  _websiteState createState() => _websiteState();
}

class _websiteState extends State<Website> {
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: 'https://www.handong.edu',
    );
  }
}
