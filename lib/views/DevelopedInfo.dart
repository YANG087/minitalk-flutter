import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeveloperInfo extends StatefulWidget {
  const DeveloperInfo({Key key}) : super(key: key);

  @override
  _DeveloperInfoState createState() => _DeveloperInfoState();
}

class _DeveloperInfoState extends State<DeveloperInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Developer By"),
        elevation: 0.0,
        centerTitle: false,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            mainText("피플라이프"),
            SizedBox(height: 10,),
            mainText("김예은"),
            SizedBox(height: 20,),
            mainText("피플라이프"),
            SizedBox(height: 10,),
            mainText("양은지"),
          ],
        ),
      ),
    );
  }
}

Text mainText(String text) {
  return Text(text,
    style: TextStyle(
      color: Colors.white,
      fontSize: 16,
    ),
  );
}



