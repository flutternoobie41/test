import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

class ErrorPage extends StatefulWidget {
  @override
  _ErrorPageState createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 10), (){
      exit(0);
    });
  }
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFF7036A6),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF7036A6), Color(0xFFa85bcf)],
                  begin: Alignment.centerRight,
                  end: Alignment.bottomCenter,
                )
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(child: Text("No Connection",style: TextStyle(color: Colors.white,fontSize: w*0.08,fontWeight: FontWeight.bold),)),
                        SizedBox(height: 10,),
                        Center(child: Text("No internet connection found. Please check your connection or try again.",style: TextStyle(color: Colors.white),)),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style:ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      // textStyle: TextStyle(color: Color(0xFF7036A6)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Exit",style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,color: Color(0xFF7036A6)),
                      ),
                    ),
                    onPressed: (){
                      exit(0);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
