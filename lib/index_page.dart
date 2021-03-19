import 'package:first_flutter_app/base/base_page.dart';
import 'package:first_flutter_app/views/guide_page.dart';
import 'package:first_flutter_app/views/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:common_utils/common_utils.dart';

class IndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return IndexPageState();
  }
}

//start page
//local data cache
class IndexPageState extends BasePage<IndexPage> {
  bool isFirst, isShowBG = false;
  num backTime;
  TimerUtil timerUtil;
  double progressValue;
  @override
  // ignore: must_call_super
  void initState() {
    super.initState();
    timerUtil = new TimerUtil(mInterval: 50, mTotalTime: 5000);
    timerUtil.setOnTimerTickCallback((int value) {
      setState(() {
        backTime = value;
      });
      if (backTime == 0) {
        pushReplacePage(HomePage());
      }
    });
    timerUtil.startCountDown();
    ReadCacheData();
  }

  //异步读取数据
  // ignore: non_constant_identifier_names
  void ReadCacheData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstLogin = prefs.getBool('flutter_is_first_login');
    if (isFirstLogin == null || isFirstLogin == false) {
      prefs.setBool('flutter_is_first_login', true);
      pushReplacePage(GuidePage());
    } else {
      isShowBG = true;
    }
    isFirst = isFirstLogin;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          buildBackgroundImg(),
          buildProgress(),
          Positioned(
              bottom: 100,
              right: 0,
              left: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipOval(
                      child: Image.asset(
                    'assets/images/lake.jpg',
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover,
                  )),
                  SizedBox(width: 14),
                  Text('welcome flutter')
                ],
              )),
        ],
      ),
    );
  }

  buildBackgroundImg() {
    return isShowBG
        ? Image.asset(
            'assets/images/index_pic.jpg',
            height: double.infinity,
            width: double.infinity,
            // fit: BoxFit.cover,
          )
        : Container();
  }

  buildProgress() {
    return Positioned(
        bottom: 20,
        right: 20,
        child: InkWell(
          onTap: () {
            if (timerUtil.isActive()) {
              timerUtil.cancel();
            }
            pushReplacePage(HomePage());
          },
          child: SizedBox(
              height: 40,
              width: 40,
              child: Stack(
                children: [
                  Center(
                      child: CircularProgressIndicator(
                    value: (backTime / 5000),
                  )),
                  Center(
                      child: Text('${(backTime ~/ 1000).toInt()}s',
                          style: TextStyle(
                            color: Colors.red,
                          ))),
                ],
              )),
        ));
  }

  buildLoadingProgress() {}
}
