/* 앱 실행시 처음 3초만 보여 주는 화면 */

import 'dart:async'; // 'Timer' 때문에 필요

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:fur_ever_love/mainpages/main_home.dart';
import 'package:fur_ever_love/login/fel_login.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LandingPage extends StatefulWidget {

  @override
  _LandingPageState createState() => _LandingPageState();

}

class _LandingPageState extends State<LandingPage> {

  // Future : 비동기 작업시 사용, 일정 소요 시간 소요 후 실제 데이터 or 에러 반환 ex) 주문서
  //          async 클래스는 await 매서드 가짐
  //           -> await로 선언된 메서드는 응답이 처리될 때까지 대기

  Future<bool> checkLogin() async { // bool == boolean ( t or f 로 반환 )
    SharedPreferences prefs = await SharedPreferences.getInstance();
      bool isLogin = prefs.getBool('isLogin') ?? false;
      return isLogin;
  }

  void moveScreen() async {
    await checkLogin().then((isLogin) {
      // get.to() : 화면 간 이동 가능 | get.offAll() : 전의 이동 기록 모두 삭제
      if(isLogin) {
        Get.offAll(MainHome());
      } else {
        Get.offAll(LoginScreen());
      }
    });
  }

  @override
  void initState() { // class 가 호출 되었을 때 제일 처음 상태를 결정 해주는 함수 (1번만 실행 되는 함수)
    super.initState();
    Timer(Duration(seconds: 3),() { // 3초만 보여줌
      moveScreen();
      //Get.offAll(MainHome()); // get.to() : 화면 간 이동 가능 | get.offAll() : 전의 이동 기록 모두 삭제
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: const Color(0xffEBE4D1),
        child: Center(
          child: Stack( // Stack 자식 Widget 들을 겹쳐서 표현 하기 위해 사용
            // :: 원래는 Column 을 이용 하여 이미지 아래 text 를 위치 하게 하려고 했으나 거리 조절이 안되어 사용
            alignment: Alignment.center,
            children: <Widget>[
              Transform.scale( // 이미지 크기 줄이기 위해 사용
                scale: 0.2,
                child: Image.asset('assets/images/mango.png', fit: BoxFit.contain),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 120.0), //이미지 아래에 텍스트 오게 배치
                  child: Text( 'FUR EVER LOVE :)',
                    style: TextStyle( // 텍스트 스타일 설정
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Supermagic',
                      color: const Color(0xffBA704F),
                    ),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}