import 'dart:convert';

import 'package:fluro/fluro.dart';

import 'package:flutter_1800/pages/home.dart';

import 'package:flutter_1800/pages/user/loginView.dart';
import 'package:flutter_1800/pages/user/registerView.dart';

class Routers {
  // 登录页面
  static final Handler _loginHandler =
      Handler(handlerFunc: (context, parameters) {
    return const LoginViewPage();
  });

  // 登录页面
  static final Handler _registerHandler =
      Handler(handlerFunc: (context, parameters) {
    return const RegisterViewPage();
  });

  static final Handler _homeHandler =
      Handler(handlerFunc: (context, parameters) {
    return const HomePage();
  });

  /// fluro 传递后取出参数，解析
  static String fluroCnParamsDecode(String encodeCn) {
    List<int> list = [];

    ///字符串解码
    for (var data in jsonDecode(encodeCn)[0]) {
      list.add(data);
    }
    return const Utf8Decoder().convert(list);
  }

  static void configureRoutes(FluroRouter router) {
    // 登录页面
    router.define('/', handler: _homeHandler);
    // 登录页面
    router.define('/login', handler: _loginHandler);
    router.define('/register', handler: _registerHandler);
  }
}
