import 'package:chatapp/helper/helperfunctions.dart';
import 'package:chatapp/widget/widget.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({ Key key }) : super(key: key);

  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  String myName = "";
  String email = "";

  getUserInfo() async {
    myName = await HelperFunctions.getUserNameSharedPreference();
    email = await HelperFunctions.getUserEmailSharedPreference();
    setState(() {
    });
  }
  @override
  void initState() {
    getUserInfo();
    super.initState();
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
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/user_icon.png'),
                backgroundColor: Colors.white,
              ),
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
                Icons.home,
                color: Colors.white,
              ),
              title: Text(
                'Home',
                style: TextStyle(
                  color: Colors.white
                ),
              ),
              trailing: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onTap: () {
                print('Home!');
              },
            ),
          ],
        ),
      ),
    );
  }
}