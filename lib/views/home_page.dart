import 'package:first_flutter_app/views/main/main_community_page.dart';
import 'package:first_flutter_app/views/main/main_find_page.dart';
import 'package:first_flutter_app/views/main/main_home_page.dart';
import 'package:first_flutter_app/views/main/main_myself_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeWidgetState();
  }
}

List<String> buttomNavList = ['首页', '论坛', '发现', '我的'];
List<Widget> homePageList = [
  MainHomePage(),
  MainCommunityPage(),
  MainFindPage(),
  MainMyselfPage()
];
num buttomIndex = 0;
const IconData house = IconData(0xe7c7, fontFamily: 'MaterialIcons');

class HomeWidgetState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Home Page'),
        ),
        body: homePageList[buttomIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          iconSize: 20,
          showUnselectedLabels: true,
          // unselectedLabelStyle: TextStyle(color: Colors.grey),
          currentIndex: buttomIndex,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  // color: buttomIndex == 0 ? Colors.blue : Colors.grey,
                ),
                label: '首页'),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.business,
              ),
              label: '论坛',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: '发现',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '我的',
            ),
          ],
          onTap: (value) {
            setState(() {
              buttomIndex = value;
            });
          },
        ));
  }
}
