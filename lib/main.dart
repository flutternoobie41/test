import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_project/pages/error_page.dart';
import 'package:test_project/pages/loginpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState(){
    super.initState();
    Timer(Duration(milliseconds: 1400), (){
      check();
    });
  }


  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,DeviceOrientation.portraitDown
    ]);
    var w= MediaQuery.of(context).size.width;
    return Scaffold(
        body: Center(child: Image.asset("assets/png/search.png",width:w*0.68,))
    );
  }
  void check() async {
    try {
      final result = await InternetAddress.lookup("google.com");
      if(result.isNotEmpty && result[0].rawAddress.isNotEmpty)
      {

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
      }
    }
    on SocketException catch(_){
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context)=>ErrorPage())
      );
    }
  }
}