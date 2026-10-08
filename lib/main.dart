import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/logic/helper_methods.dart';
import 'package:flutter_application_2/views/auth/create_new_bassword.dart';
import 'package:flutter_application_2/views/auth/login.dart';
import 'package:flutter_application_2/views/auth/loginhabitthink.dart';
import 'package:flutter_application_2/views/auth/on_boarding.dart';
import 'package:flutter_application_2/views/auth/phonenumber.dart';
import 'package:flutter_application_2/views/auth/play.dart';
import 'package:flutter_application_2/views/auth/play2.dart';
import 'package:flutter_application_2/views/auth/signup.dart';
import 'package:flutter_application_2/views/auth/splash.dart';
import 'package:flutter_application_2/views/categories.dart';
import 'package:flutter_application_2/views/home/pages/home.dart';
import 'package:flutter_application_2/views/home/pages/notifications.dart';
import 'package:flutter_application_2/views/home/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/views/home/play3.dart';
import 'package:flutter_application_2/views/home/play4.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/logic/helper_methods.dart';

late SharedPreferences prefs;
void main() async {
  await ScreenUtil.ensureScreenSize();
  prefs= await SharedPreferences.getInstance();
  runApp(
    MyApp(),
    /* MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navKey,
      home: NotificationsPage(),
      theme: ThemeData(
        appBarTheme: AppBarThemeData(centerTitle: true),
        scaffoldBackgroundColor: Color(0xfff3f5f9),
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff1c3877)),
        inputDecorationTheme: InputDecorationThemeData(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: Color(0xff1c3877),
            disabledBackgroundColor: Color(0xff0063e6).withValues(alpha: .40),
            disabledForegroundColor: Colors.white,
            fixedSize: Size.fromHeight(52),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(16),
            ),
          ),
        ),
      ),
    ),*/
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilPlusInit(
      designSize: Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: navKey,
          //prefs.getBool("is login")==true?HomeView():
          home: Play4View(),
          theme: ThemeData(
            appBarTheme: AppBarThemeData(centerTitle: true),
            scaffoldBackgroundColor: Color(0xfff3f5f9),
            colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff1c3877)),
            inputDecorationTheme: InputDecorationThemeData(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            filledButtonTheme: FilledButtonThemeData(
              style: FilledButton.styleFrom(
                backgroundColor: Color(0xff1c3877),
                disabledBackgroundColor: Color(
                  0xff0063e6,
                ).withValues(alpha: .40),
                disabledForegroundColor: Colors.white,
                fixedSize: Size.fromHeight(52),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
