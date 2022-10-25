import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamel/Controlleelper/controller_helper.dart';
import 'package:table_calendar/table_calendar.dart';
class VisitReport extends StatefulWidget {
  const VisitReport({Key? key}) : super(key: key);

  @override
  State<VisitReport> createState() => _VisitReportState();
}

class _VisitReportState extends State<VisitReport> {

   DateTime? _selectedDay;
   DateTime? _focusedDay;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding:const EdgeInsets.symmetric(horizontal: 21),
     children: [
       TableCalendar(

      onPageChanged: (focusedDay) {
        _focusedDay = focusedDay;
      },
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay; // update `_focusedDay` here as well
        });
      },
         calendarStyle:const CalendarStyle(markerSize: 40,
             selectedDecoration:BoxDecoration(color: Color(0xFF4F7F71),
         ) ,
             todayDecoration: BoxDecoration(color: Color(0xFF4F7F71),
                 borderRadius: BorderRadius.all(Radius.circular(10))),
             cellMargin: EdgeInsets.symmetric(horizontal: 7)
         ),
    firstDay: DateTime.utc(2010, 10, 16),
    lastDay: DateTime.utc(2030, 3, 14),
    focusedDay: DateTime.now(),
      daysOfWeekHeight: 30.0,
      rowHeight: 40.0,
    ),
      const SizedBox(height: 24,),
       Container(
         padding:  EdgeInsets.all(10),
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(10.r),
           border: Border.all(color: Color(context.greenColor) ,width: 1),
           color: Colors.white,
           boxShadow:const [
             BoxShadow(
                 offset: Offset(0, 1),
                 color: Colors.black12,
                 blurRadius: 5)
           ],
         ),
         child: Column(
           mainAxisAlignment:MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Center(child:
             context.text(text: "4 جمادي الاول 1443 ",
                 size: 14, color: context.blackColor ,wieght: FontWeight.w400 ),)
            ,
             const  SizedBox(height: 9,),
             context.text(text: "الزيارة السابقة للجمعية",
                 size: 13, color: context.blackColor ,wieght: FontWeight.w400 ),

             const SizedBox(height: 13,),
             Row(children: [
               Icon(Icons.alarm ,size: 20, color: Color(context.greenColor),),
               context.text(text: "10:30 AM",
                   size: 13, color: context.blackColor ,wieght: FontWeight.w400),
             ],),
             const SizedBox(height: 13,),
             Row(children: [
               Icon(Icons.location_on_outlined ,size: 20, color: Color(context.greenColor),),
               context.text(text: "الرياض جمعية شمل",
                   size: 13, color: context.blackColor ,wieght: FontWeight.w400),

               const SizedBox(width: 34,),
               Icon(Icons.arrow_back_ios ,size: 10, color: Color(context.greyColor),),
               context.text(text: "الموقع على الخريطة",
                   size: 10, color: context.greyColor ,wieght: FontWeight.w400),



             ],),

           ],),
       ),


     ],
    );
  }


}
