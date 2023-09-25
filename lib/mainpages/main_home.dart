import 'package:flutter/material.dart';
import 'package:fur_ever_love/mainpages/tab_home.dart';
import 'package:fur_ever_love/mainpages/tab_event.dart';
import 'package:fur_ever_love/mainpages/tab_adoption.dart';
import 'package:fur_ever_love/mainpages/tab_community.dart';
import 'package:fur_ever_love/mainpages/tab_profile.dart';

//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainHome extends StatefulWidget {

  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {

  // icon 마다 index 를 주기 위해 사용
  int _selectedIdx = 0;

  // icons 설정
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      label: '홈',
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.card_giftcard),
        label: '이벤트'
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.all_inclusive),
        label: '입양'
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.bubble_chart_outlined),
        label: '우리동네'
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: '내정보'
    ),
  ];

  // icons 에 따른 페이지 링크 설정
  List<Widget> pages = [
    TapHome(),
    TapEvent(),
    TapAdoption(),
    TapCommunity(),
    TapProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( // 상단바
        title: Text(
          'FUR-EVER LOVE',
          style: TextStyle(
            color: Colors.black,
            fontFamily:'Supermagic',
            fontSize: 20,
          ),
        ),
        backgroundColor: const Color(0xffEBE4D1), // 상단바 배경색
      ),
      bottomNavigationBar: BottomNavigationBar( // 하단바
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xffEBE4D1), // 하단바 배경색
        selectedItemColor: Colors.black, // 선택 o 색상
        unselectedItemColor: Colors.grey.withOpacity(.60), // 선택 x 색상
        selectedFontSize: 10, // 선택 o 폰트 사이즈
        unselectedFontSize: 8, // 선택 x 폰트 사이즈
        //selectedLabelStyle: const TextStyle(fontSize: 12),
        iconSize: 20,
        currentIndex: _selectedIdx,
        onTap: (index) {
          setState(() {
            _selectedIdx = index;
          });
        },
        items: bottomItems,
      ),
      body: pages[_selectedIdx],
    );
  }
}