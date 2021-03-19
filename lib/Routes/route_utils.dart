import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteUtil {
  static void pushPage(Widget widget, BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) => widget));
  }

  static void popPage(Widget widget, BuildContext context) {
    Navigator.of(context)
        .pop(MaterialPageRoute(builder: (BuildContext context) => widget));
  }

  static void pushReplacePage(Widget widget, BuildContext context) {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => widget));
  }
}
