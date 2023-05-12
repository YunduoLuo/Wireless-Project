import 'dart:convert';

import 'package:fluro/fluro.dart';


import 'package:flutter_1800/pages/home.dart';
import 'package:flutter_1800/pages/user/loginView.dart';
import 'package:flutter_1800/pages/user/registerView.dart';


class Routers {
  // route to the Loginpage
  static final Handler _loginHandler =
      Handler(handlerFunc: (context, parameters) {
    return const LoginViewPage();
  });

  // route to the register page
  static final Handler _registerHandler =
      Handler(handlerFunc: (context, parameters) {
    return const RegisterViewPage();
  });
  //route to the homepage
  static final Handler _homeHandler =
      Handler(handlerFunc: (context, parameters) {
    return const HomePage();
  });



  /// fluro takes out the parameters after passing them and parses them
  static String fluroCnParamsDecode(String encodeCn) {
    List<int> list = [];

    ///String decoding
    for (var data in jsonDecode(encodeCn)[0]) {
      list.add(data);
    }
    return const Utf8Decoder().convert(list);
  }

 
  static void configureRoutes(FluroRouter router) {
    // home page route
    router.define('/', handler: _homeHandler);
    // Login page
    router.define('/login', handler: _loginHandler);
    // register page
    router.define('/register', handler: _registerHandler);
  }
}
