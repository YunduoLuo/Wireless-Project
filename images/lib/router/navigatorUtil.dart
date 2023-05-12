import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_1800/router/application.dart';

class NavigatorUtil {
    // 返回
    static void goBack(BuildContext context) {
        Application.fluroRouter.pop(context);
    }

    // 带参数的返回
    static void goBackWithParams(BuildContext context, result) {
        Navigator.pop(context, result);
    }

    // 路由返回指定页面
    static void goBackUrl(BuildContext context, String title) {
        Navigator.popAndPushNamed(context, title);
    }

    // 清空栈区跳转
    static void goPageReplace(BuildContext context,String path,[TransitionType transitionType = TransitionType.inFromRight]) {
        Application.fluroRouter.navigateTo(context, path, replace: true,transition: transitionType,clearStack: true);
        
    }

    /// 框架自带的有 native，nativeModal，inFromLeft，inFromRight，inFromBottom，fadeIn，custom
    /// 跳转到转场动画页面 inFromRight
    static Future jump(BuildContext context, String title) {
        return Application.fluroRouter.navigateTo(context, title, transition: TransitionType.cupertino);
    }

    /// 跳转到转场动画页面 inFromLeft
    static Future jumpLeft(BuildContext context, String title) {
        return Application.fluroRouter.navigateTo(context, title, transition: TransitionType.inFromRight);
    }
}
