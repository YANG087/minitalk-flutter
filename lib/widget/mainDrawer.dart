import 'package:chatapp/helper/authenticate.dart';
import 'package:chatapp/helper/helperfunctions.dart';
import 'package:chatapp/services/auth.dart';
import 'package:chatapp/services/database.dart';
import 'package:chatapp/views/DevelopedInfo.dart';
import 'package:chatapp/views/selectUserFace.dart';
import 'package:chatapp/widget/widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({ Key key }) : super(key: key);

  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  DatabaseMethods databaseMethods = new DatabaseMethods();
  String myName = "";
  String email = "";
  String faceNum = "";

  initiateFace(String userName) async {
    String faceNumStr = await databaseMethods.getFace(userName);
    faceNum = faceNumStr;
    setState(() {
    });
  }

  getUserInfo() async {
    myName = await HelperFunctions.getUserNameSharedPreference();
    email = await HelperFunctions.getUserEmailSharedPreference();
    initiateFace(myName);
    setState(() {
    });
  }
  @override
  void initState() {
    print("initState");
    getUserInfo();
    super.initState();
  }
  @override
  void deactivate() {
    print("deactivate");
    super.deactivate();
  }

  @override
  void didChangeDependencies() {
    print("didChangeDependencies");
    super.didChangeDependencies();
  }
  @override
  void didUpdateWidget(covariant MainDrawer oldWidget) {
    print("didUpdateWidget");
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.black87,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(myName),
              accountEmail: Text(email),
              currentAccountPicture: showFaceIcon(faceNum),
              onDetailsPressed: () {
                print('detail 클릭');
              },
              decoration: BoxDecoration(
                  color: primaryColor2(),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(40.0)
                  )
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.people,
                color: Colors.white,
              ),
              title: Text(
                'Developed By',
                style: TextStyle(
                  color: Colors.white
                ),
              ),
              trailing: Icon(
                Icons.arrow_right,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DeveloperInfo()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.people,
                color: Colors.white,
              ),
              title: Text(
                '채팅 표정 고르기',
                style: TextStyle(
                    color: Colors.white
                ),
              ),
              trailing: Icon(
                Icons.arrow_right,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SelectUserFace()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.people,
                color: Colors.white,
              ),
              title: Text(
                '로그아웃',
                style: TextStyle(
                    color: Colors.white
                ),
              ),
              trailing: Icon(
                Icons.arrow_right,
                color: Colors.white,
              ),
              onTap: () {
                AuthService().signOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Authenticate()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget showFaceIcon(String faceNum){
  AssetImage img;
  if(faceNum == "1") img = AssetImage('assets/images/face_1.png');
  if(faceNum == "2") img = AssetImage('assets/images/face_2.png');
  if(faceNum == "3") img = AssetImage('assets/images/face_3.png');
  else return null;
  return CircleAvatar(
    backgroundImage: img,
    backgroundColor: Colors.white,
  );
}