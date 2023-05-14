import 'package:flutter/material.dart';
import 'package:mirror_wall/Education_app/provider/education_provider.dart';
import 'package:mirror_wall/Education_app/view/Home_edu.dart';
import 'package:mirror_wall/Education_app/view/web_education.dart';
import 'package:mirror_wall/OTT_APP/provider/ott_provider.dart';
import 'package:mirror_wall/OTT_APP/view/Home_ott.dart';
import 'package:mirror_wall/OTT_APP/view/Web_ott.dart';
import 'package:mirror_wall/Web_view/provider/web_provider.dart';
import 'package:mirror_wall/Web_view/view/web_Screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => Education_app(),
      ),
      ChangeNotifierProvider(
        create: (context) => Ott_Provider(),
      ),
      ChangeNotifierProvider(
        create: (context) => Web_Provider(),
      )
    ],
    child: Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            // EDUCATION APP
            // '/': (context) => Home_edu(),
            // 'app': (context) => Web_Screen(),

            // OTT APP
            '/': (context) => Home_Ott(),
             'app': (context) => Web_Ott(),

            //WEB_VIEW
            // '/':(context) => Inappweb(),
          },
        );
      },
    ),
  ));
}
