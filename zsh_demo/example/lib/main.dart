import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:zsh_demo/zsh_demo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DemoFunction _demoFunction;

  @override
  void initState() {
    super.initState();
    _demoFunction = DemoFunction();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            Container(
              height: 40,
              child:
              InkWell(
                onTap: (){
                  _demoFunction.flutterToNative();
                },
                child: Text("发送一个无参数无返回值消息给原生"),
              ),
            ),
            Container(
              height: 40,
              child:
              InkWell(
                onTap: (){
                  _demoFunction.flutterToNativeWith("flutter").then((value) {

//                     ToastUtils.toast("接收到原生返回值是: $value");
                  });
                },
                child: Text('发送一个有参数有返回值消息给原生'),
              ),
            ),
            StreamBuilder<String>(
                stream:_demoFunction.nativeToFlutterStream(),
                initialData: "",
                builder: (c, snapshot) {
                  final text = snapshot.data;

                  return Container(
                    height: 40,
                    child:
                    Text((snapshot?.data != null) ? '收到原生调用来的带参数方法，参数为: $text' : ""),
                  );
                }),
            Container(
              height: 40,
              child: LabelWidget("flutter端写的参数"),
            ),
            StreamBuilder<String>(
                stream:_demoFunction.receiveMessageStream(),
                initialData: "",
                builder: (c, snapshot) {
                  final text = snapshot.data;

                  return Container(
                    height: 40,
                    child:
                    Text((snapshot?.data != null) ? '收到消息 $text' : ""),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
