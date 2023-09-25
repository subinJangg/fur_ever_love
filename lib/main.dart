import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fur_ever_love/settings/landing_page.dart';
import 'package:fur_ever_love/login/fel_login.dart';
import 'package:fur_ever_love/mainpages/main_home.dart';
// import 'package:fur_ever_love/mainpages/main_home.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() { // 앱 실행
  runApp(MyApp());
}

class MyApp extends StatelessWidget { // 상태 변경 없는 위젯. 한번 UI가 그려지면 그대로 있음. splash screen

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: LandingPage(),
      debugShowCheckedModeBanner: false, // 화면에 debug 표시 안보이게 함
      theme: ThemeData(fontFamily: 'Dapretty'), //앱 전체 폰트 지정
      themeMode: ThemeMode.system,
    );
  }
}
//   @override
//   Widget build(BuildContext context) { // UI 만드는 부분
//     return MaterialApp( // MaterialApp Design(구글 기본 디자인) 사용해서 앱 만듦
//       title: 'Fur Ever Love',
//       debugShowCheckedModeBanner: false, // 화면에 debug 표시 안보이게 함
//       theme: ThemeData(fontFamily: 'Dapretty'), //앱 전체 폰트 지정
//       themeMode: ThemeMode.system,
//       home: MyHomePage(),
//       routes: {
//         '/index': (context) => IndexScreen(),
//       },
//       initialRoute: '/index',
//
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: LandingPage(),
//     );
//   }
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("FUR-EVER LOVE"),
//         backgroundColor: Colors.white54,
//         leading: Padding(
//           padding: const EdgeInsets.all(9.0),
//           child: Image.asset(
//             'assets/images/mango.png', // 이미지 파일의 경로
//             width: 20, // 이미지의 가로 너비 조절
//             height: 20, // 이미지의 세로 높이 조절
//           ),
//         ),
//       ),
//     );
//   }
// }

// FontAwesomeIcons
// class MyWidget extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
//         icon: FaIcon(FontAwesomeIcons.gamepad),
//         onPressed: () { print("Pressed"); }
//     );
//   }
// }
