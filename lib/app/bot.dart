import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shamel/Screen/calender.dart';
import 'package:shamel/app/home.dart';
import 'package:shamel/Controlleelper/controller_helper.dart';
import 'package:shamel/Screen/location.dart';
import 'package:shamel/models/bot_model.dart';
import 'package:shamel/Screen/more.dart';
import 'package:shamel/Screen/visite_report.dart';

import '../Screen/test.dart';


class BottomNavigationBarW extends StatefulWidget {
  const BottomNavigationBarW({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarW> createState() => _BottomNavigationBarWState();
}

class _BottomNavigationBarWState extends State<BottomNavigationBarW> {

  final List<BnScreen> _screen = <BnScreen> [
    BnScreen(title: "شَمْل", widget: Home()),
    BnScreen(title: "شَمْل", widget: VisitReport()),
    BnScreen(title: "شَمْل", widget: Location()),
    BnScreen(title: "شَمْل", widget: More()),];

  int _currentPaeg = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _currentPaeg < 3 ? PreferredSize(preferredSize:const Size.fromHeight(80.0),
        child: AppBar(
          title: Text("شَمْل" ,style :GoogleFonts.cairo(fontSize: 20 ,color: Colors.white),),
          centerTitle: true,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)
              ,bottomRight: Radius.circular(20))),
          backgroundColor: Color(context.greenColor) ,),) : null,

      body: _screen[_currentPaeg].widget,
    bottomNavigationBar: ClipRRect(
    borderRadius: BorderRadius.only(topLeft: Radius.circular(20.r),
      topRight: Radius.circular(20.r), ),
    child:BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.white,
          elevation: 5,
          onTap: (int cuttentPage) {
            setState(() => _currentPaeg = cuttentPage);
          },
          currentIndex: _currentPaeg,

          selectedIconTheme: IconThemeData(color: Color( context.greenColor) ),
          selectedLabelStyle: TextStyle(
              fontWeight: FontWeight.bold, color:Color( context.greenColor) ,fontSize: 12),
          selectedItemColor: Color(context.greenColor),
          showUnselectedLabels: true,
          unselectedIconTheme: const IconThemeData(color: Color(0xFF979797)),
          unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w300, color:Color(0xFF979797), fontSize: 12),
          items:const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              activeIcon: Icon(Icons.home_outlined),
              label: "الرئيسية",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_sharp),
              label: "تقرير الزيارات",
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.location_on_outlined),
              label: "موقع الجمعية",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: "المزيد",

            ),
          ]),

    )
    );
  }


}
