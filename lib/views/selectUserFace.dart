import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectUserFace extends StatefulWidget {
  const SelectUserFace({Key key}) : super(key: key);

  @override
  _SelectUserFaceState createState() => _SelectUserFaceState();
}

class _SelectUserFaceState extends State<SelectUserFace> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("채팅 표정 고르기"),
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



