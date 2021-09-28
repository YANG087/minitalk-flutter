import 'package:chatapp/helper/helperfunctions.dart';
import 'package:chatapp/services/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectUserFace extends StatefulWidget {
  const SelectUserFace({Key key}) : super(key: key);

  @override
  _SelectUserFaceState createState() => _SelectUserFaceState();
}

class _SelectUserFaceState extends State<SelectUserFace> {
  DatabaseMethods databaseMethods = new DatabaseMethods();

  addFace(String faceNum) async{
    String userName = await HelperFunctions.getUserNameSharedPreference();
    String email = await HelperFunctions.getUserEmailSharedPreference();
    Map<String, dynamic> userFace = {
      "users": userName,
      "faceNum" : faceNum,
    };

    databaseMethods.addFace(userName, userFace);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("채팅 표정 고르기"),
          content: new Text("수정되었습니다."),
          actions: <Widget>[
            new FlatButton(
              child: new Text("확인"),
              onPressed: () {
                Navigator.pop(context);
                close();
              },
            ),
          ],
        );
      },
    );

  }

  close() {
    Navigator.pop(context);
  }

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20,),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/face_1.png'),
                    backgroundColor: Colors.white,
                    radius: 30,
                  ),
                  TextButton(
                    onPressed: (){
                      addFace("1");
                    },
                    child: Text("선택"),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/face_2.png'),
                    backgroundColor: Colors.white,
                    radius: 30,
                  ),
                  TextButton(
                    onPressed: (){
                      addFace("2");
                    },
                    child: Text("선택"),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/face_3.png'),
                    backgroundColor: Colors.white,
                    radius: 30,
                  ),
                  TextButton(
                    onPressed: (){
                      addFace("3");
                    },
                    child: Text("선택"),
                  ),
                ],
              ),
            ),
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



