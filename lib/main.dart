import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shamel/Auth/login.dart';
import 'package:shamel/Auth/save_information.dart';
import 'package:shamel/Auth/update_information.dart';
import 'package:shamel/Screen/advice.dart';
import 'package:shamel/Screen/calender.dart';
import 'package:shamel/Screen/methaq.dart';
import 'package:shamel/Screen/notification.dart';
import 'package:shamel/app/bot.dart';
import 'package:shamel/Auth/enter_pass_code.dart';
import 'package:shamel/Auth/forget_password.dart';
import 'package:shamel/app/lunch_screen.dart';
import 'package:shamel/app/on_bording.dart';
import 'package:shamel/Screen/child.dart';
import 'package:shamel/Screen/contect_with_us.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shamel/Screen/more.dart';
import 'package:shamel/Auth/reset_new_pass.dart';
import 'package:shamel/Screen/sent_order.dart';
import 'package:shamel/Screen/who_us.dart';
import 'package:flutter/services.dart';
import 'package:shamel/images/upload_image.dart';
import 'package:shamel/prefs/shared_pref_controller.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPref();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
        designSize: const Size(390, 815),
         minTextAdapt: true,
    builder: (context ,child) {
      return MaterialApp(

        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: [
          Locale("ar"),
          Locale("en"),

        ],
        locale: Locale("ar"),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          centerTitle: true,
                  elevation: 0,
                  iconTheme:  IconThemeData(
                      color: Colors.white),

        )),
        initialRoute: '/lunch_screen',
        routes: {
          '/on_bording': (context) => const  OnBording(),
          '/lunch_screen': (context) => const LunchScreen(),
          '/save_information': (context) => SaveInformation(),
          '/login' :(context) => const Login(),
          '/home' :(context) => const UpdateInformation(),
          '/bot' :(context) => const BottomNavigationBarW(),
          '/child' :(context) => const Child(),
          '/more' :(context) => const More(),
          '/who_us' :(context) => const WhoUs(),
          '/advice' :(context) => const Advice(),
          '/sent_order' :(context) =>  SentOrder(),
          '/update_information' :(context) => const UpdateInformation(),
          '/conect_with_us' :(context) =>const ConectWithUs(),
          '/calender' :(context) =>const CalenderVisits(),
          '/notification' :(context) => NotificationScreen(),
          '/methaq' :(context) => MethaqScreen(),
        //  '/reset_new_pass' :(context) =>const ResetNewPassword(),





        },
      );
    });
        }
}
