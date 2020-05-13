import 'dart:async';

import 'package:flutter/material.dart';
import 'package:klarna_inapp_flutter_plugin/klarna_hybrid_sdk.dart';
import 'package:klarna_inapp_flutter_plugin/klarna_web_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initWebView();
    initHybridSDK();
  }

  Future<void> initWebView() async {
    await KlarnaWebView.loadURL("https://www.google.com");
  }

  Future<void> initHybridSDK() async {
    await KlarnaHybridSDK.initialize("");
    await KlarnaHybridSDK.setupWebView();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: $_platformVersion\n'),
        ),
      ),
    );
  }
}