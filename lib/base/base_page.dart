import 'package:first_flutter_app/Routes/route_utils.dart';
import 'package:flutter/cupertino.dart';

abstract class BasePage<T extends StatefulWidget> extends State<T> {
  void pushPage(Widget widget) {
    RouteUtil.pushPage(widget, context);
  }

  void popPage(Widget widget) {
    RouteUtil.popPage(widget, context);
  }

  void pushReplacePage(Widget widget) {
    RouteUtil.pushReplacePage(widget, context);
  }
}
