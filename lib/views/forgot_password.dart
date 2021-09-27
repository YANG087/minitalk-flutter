import 'package:chatapp/services/auth.dart';
import 'package:chatapp/services/database.dart';
import 'package:chatapp/views/signup.dart';
import 'package:chatapp/widget/widget.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailEditingController = new TextEditingController();

  AuthService authService = new AuthService();
  DatabaseMethods databaseMethods = new DatabaseMethods();

  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  close() {
    Navigator.pop(context);
  }

  sendMail() async {

    if(formKey.currentState.validate()){
      setState(() {
        isLoading = true;
      });

      await authService.resetPass(emailEditingController.text).then((result){
        setState(() {
          isLoading = false;
          if(result != null){
            print("메일 전송 성공.");
            showDialog(
              context: context,
              builder: (BuildContext context) {
                // return object of type Dialog
                return AlertDialog(
                  title: new Text("비밀번호 찾기"),
                  content: new Text("메일로 비밀번호 변경 링크를 전송했습니다."),
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
          }else{
            print("없는 이메일.");
            showDialog(
              context: context,
              builder: (BuildContext context) {
                // return object of type Dialog
                return AlertDialog(
                  title: new Text("비밀번호 찾기"),
                  content: new Text("가입되지 않은 이메일 입니다."),
                  actions: <Widget>[
                    new FlatButton(
                      child: new Text("확인"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              },
            );
          }
        });
      });
    }
  }

  Widget forGotPasswordAppBar() {
    return AppBar(
      title: Text("비밀번호 찾기"),
      elevation: 0.0,
      centerTitle: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: forGotPasswordAppBar(),
      body: isLoading ? Container(child: Center(child: CircularProgressIndicator(),),) :  Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Spacer(),
            Form(
              key: formKey,
              child: Column(
                children: [
                  Icon(
                    Icons.mail,
                    size: 150,
                    color: primaryColor(),
                  ),
                  // Image.asset("assets/images/logo.png"),
                  SizedBox(height: 15),
                  Text(
                    "가입하셨던 이메일로 비밀번호 변경 링크를 보내드립니다.",
                    style: explanationTextStyle(),
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    controller: emailEditingController,
                    style: simpleTextStyle(),
                    validator: (val){
                      return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val) ?
                      null : "이메일을 정확하게 입력하여 주세요.";
                    },
                    decoration: textFieldInputDecoration("email"),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: (){
                sendMail();
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      colors: [const Color(0xff007EF4), const Color(0xff2A75BC)],
                    )),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "비밀번호 찾기",
                  style: biggerTextStyle(),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
    ;
  }
}
