import 'package:flutter/material.dart';
import 'package:fur_ever_love/login/fel_join.dart';
import 'package:fur_ever_love/mainpages/main_home.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {

  TextEditingController user_email = TextEditingController();
  TextEditingController user_password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LOGIN"),
        elevation: 0.0, // 위젯 또는 UI 요소의 Z 축 위치를 나타내는 속성(그림자 효과)
        backgroundColor: const Color(0xffEBE4D1),
        centerTitle: true,
      ),
      // GestureDetector :email, password 입력하는 부분 제외한 화면 탭하면 키보드 사라지게 함
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView( // 화면에 스크롤 가능한 단일 자식을 가진 위젯
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 50)),
              Center(
                child: Image(
                  image: AssetImage('assets/images/lingo.png'),
                  width: 50.0,
                ),
              ),
              Form(
                child: Theme(
                  data: ThemeData(
                    primaryColor: Colors.grey,
                    inputDecorationTheme: InputDecorationTheme(
                      labelStyle: TextStyle(color: Colors.teal, fontSize: 15.0))),
                  child: Container(
                    padding: EdgeInsets.all(40.0),
                    child: Builder(builder: (context) {
                      return Column(
                        children: [
                          TextField(
                            controller: user_email,
                            autofocus: true,
                            decoration: InputDecoration(labelText: 'Enter email'),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          TextField(
                            controller: user_password,
                            decoration: InputDecoration(labelText: 'Enter password'),
                            keyboardType: TextInputType.text,
                            obscureText: true, // 비밀번호 안보이게
                          ),
                          SizedBox(
                            height: 40.0,
                          ),
                          ButtonTheme(
                            minWidth: 600.0,
                            height: 50.0,
                            child: ElevatedButton(
                              onPressed: () {
                                if(user_email.text == 'mang@naver.com' && user_password.text == '123') {
                                  Get.offAll(MainHome());
                                } else if (user_email.text == 'mang@naver.com' && user_password.text != '123') {
                                  showSnackBar(context, Text('Wrong password'));
                                } else if (user_email.text != 'mang@naver.com' && user_password.text == '123') {
                                  showSnackBar(context, Text('Wrong email'));
                                } else {
                                  showSnackBar(context, Text('Check your info again'));
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orangeAccent
                              ),
                              child: Text(
                                "Login"
                              )
                            )),
                            ButtonTheme(
                              minWidth: 600.0,
                              height: 50.0,
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.to(JoinScreen());
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey
                                ),
                                child: Text(
                                  "Join Fur Love"
                                ),
                              ),

                            ),
                        ],
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}

void showSnackBar(BuildContext context, Text text) {
  final snackBar = SnackBar(
    content: text,
    backgroundColor: Color.fromARGB(255, 112, 48, 48),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

// class NextPage extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }




