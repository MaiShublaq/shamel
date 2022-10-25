import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shamel/prefs/shared_pref_controller.dart';

class LunchScreen extends StatefulWidget {
  const LunchScreen({Key? key}) : super(key: key);

  @override
  State<LunchScreen> createState() => _LunchScreenState();
}

class _LunchScreenState extends State<LunchScreen> {
  
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds:3),(){
     String route=SharedPrefController().loggedIn?'/bot':'/on_bording';
     Navigator.pushReplacementNamed(context, route);

    });



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Center(
        child: Image(alignment: Alignment.center,
          height:62.h ,
          width: 135.w,
          image: const AssetImage("images/logo.png"),)
        ,)
    );
  }
}
