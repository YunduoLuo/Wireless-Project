import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_1800/firebase_options.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/route_manager.dart';
import 'router/application.dart';
import 'router/myRouters.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';

void main() async {
  Routers.configureRoutes(Application.fluroRouter);
  runApp(const MyApp());
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.white, //这里替换你选择的颜色
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Color primaryColor = Colors.tealAccent;

  @override
  void initState() {
    //setMode();
  }

  void setMode() async {
    try {
      var modes = await FlutterDisplayMode.supported;
      modes.forEach(print);

      await FlutterDisplayMode.setPreferredMode(modes[1]);

      await FlutterDisplayMode.setHighRefreshRate();

      // setFrameRate(90);

      /// On OnePlus 7 Pro:
      /// #0 0x0 @0Hz // Automatic
      /// #1 1080x2340 @ 60Hz
      /// #2 1080x2340 @ 90Hz
      /// #3 1440x3120 @ 90Hz
      /// #4 1440x3120 @ 60Hz

      /// On OnePlus 8 Pro:
      /// #0 0x0 @0Hz // Automatic
      /// #1 1080x2376 @ 60Hz
      /// #2 1440x3168 @ 120Hz
      /// #3 1440x3168 @ 60Hz
      /// #4 1080x2376 @ 120Hz
    } on PlatformException {
      /// e.code =>
      /// noAPI - No API support. Only Marshmallow and above.
      /// noActivity - Activity is not available. Probably app is in background
    }
  }

  @override
  Widget build(BuildContext context) {
    final easyload = EasyLoading.init();

    return GetMaterialApp(
      title: 'Film market',
      builder: (BuildContext context, Widget? child) {
        return easyload(context, child);
      },
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: const Color(0x0fffffff),
          textTheme: const TextTheme(labelLarge: TextStyle(color: Colors.blue)),
          appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(color: Colors.black),
              titleTextStyle: TextStyle(
                  color: Color.fromARGB(255, 65, 57, 57), fontSize: 20.0),
              color: Colors.white)),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Application.fluroRouter.generator,
      // supportedLocales: const <Locale>[
      //   Locale('zh'), // Chinese
      //   // Locale('iw'), // Hebrew
      // ],
      // locale: const Locale('zh')
    );
  }
}
