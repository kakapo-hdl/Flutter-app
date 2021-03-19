import 'dart:ffi';

import 'package:first_flutter_app/base/base_page.dart';
import 'package:first_flutter_app/views/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class GuidePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GuidePageState();
  }
}

const List<String> swiperImgPath = [
  'swiper1.jpeg',
  'swiper2.jpeg',
  'swiper3.jpeg'
];

class GuidePageState extends BasePage {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                'assets/images/${swiperImgPath[index]}',
                fit: BoxFit.fill,
              ),
              if (index == swiperImgPath.length - 1)
                Stack(
                  children: [
                    Positioned(
                        right: 0,
                        left: 0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 120,
                            ),
                            Text(
                              '窗前明月光',
                              style:
                                  TextStyle(fontSize: 24, color: Colors.white),
                            ),
                            SizedBox(
                              height: 22,
                            ),
                            Text(
                              '古今多少圣贤',
                              style:
                                  TextStyle(fontSize: 24, color: Colors.white),
                            )
                          ],
                        )),
                    Positioned(
                        left: 0,
                        right: 0,
                        bottom: 50,
                        child: Center(
                          child: MaterialButton(
                            splashColor: Colors.grey,
                            onPressed: () {
                              pushReplacePage(HomePage());
                            },
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Text(
                              '进入首页',
                            ),
                          ),
                        ))
                  ],
                )

              // appBar: AppBar(
              //   centerTitle: true,
              //   title: Text('Guide Page'),
              // ),;
            ],
          );
        },
        itemCount: swiperImgPath.length,
        pagination: new SwiperPagination(),
      ),
    );
  }
}
