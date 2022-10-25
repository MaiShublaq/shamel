import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shamel/Controlleelper/controller_helper.dart';
import 'package:shamel/api/app/app_api.dart';
import 'package:shamel/models/vists.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
class CalenderVisits extends StatefulWidget {
  const CalenderVisits({Key? key}) : super(key: key);

  @override
  State<CalenderVisits> createState() => _CalenderVisitsState();
}

class _CalenderVisitsState extends State<CalenderVisits> {
  HijriDatePickerController _controller = HijriDatePickerController();
  List<DateTime> datelist=[];
  DateTime? _selectedDay;
  DateTime? _focusedDay;
  late Future<List<Visit>> _visitfuture;
  List<Visit> _visits = <Visit>[];
   String? _date;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _visitfuture = AppApi().getVisits();


  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding:const EdgeInsets.symmetric(horizontal: 21),
      children: [
        Card(
          elevation: 0,
          margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: SfHijriDateRangePicker(
            controller: _controller,
         //   onSelectionChanged: selectionChanged,
            view: HijriDatePickerView.month,
            selectionMode: DateRangePickerSelectionMode.multiple,
            selectionShape: DateRangePickerSelectionShape.rectangle,
            initialSelectedDates: [
            //  DateTime.now()
            ],
            showNavigationArrow: true,
            todayHighlightColor: Color(0xFF4F7F71),

            selectionColor: Color(0xFF4F7F71),
            monthViewSettings: HijriDatePickerMonthViewSettings(
                dayFormat: 'EEE',
                viewHeaderStyle: DateRangePickerViewHeaderStyle(
                  //backgroundColor: Colors.tealAccent
                )),
            //  headerStyle:
            //  DateRangePickerHeaderStyle(backgroundColor: Colors.teal),
          ),
        ),
      //  const SizedBox(height: 24,),
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
          child:  FutureBuilder<List<Visit>>(
              future:_visitfuture,
              builder: (context,snapshot){
                setState(() {
              //    datelist.add(value)
                });
                print(snapshot.data);
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasData && snapshot.data!.isNotEmpty) {


                 // _visits[_visits.length-1].startDate!

                  print(  DateTime.now());
                  _visits=snapshot.data??[];
                  return Column(
                      mainAxisAlignment:MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(child:
                        context.text(text: _visits[_visits.length-1].startDate!,
                            size: 14, color: context.blackColor ,wieght: FontWeight.w400 ),)
                        ,
                        const  SizedBox(height: 9,),
                        context.text(text: "الزيارة السابقة للجمعية",
                            size: 13, color: context.blackColor ,wieght: FontWeight.w400 ),

                        const SizedBox(height: 13,),
                        Row(children: [
                          Icon(Icons.alarm ,size: 20, color: Color(context.greenColor),),
                          context.text(text:_visits[_visits.length-1].time! ,
                              size: 13, color: context.blackColor ,wieght: FontWeight.w400),
                        ],),
                        const SizedBox(height: 13,),
                        Row(children: [
                          Icon(Icons.location_on_outlined ,size: 20, color: Color(context.greenColor),),
                          context.text(text:_visits[_visits.length-1].hub!.name! ,
                              size: 13, color: context.blackColor ,wieght: FontWeight.w400),

                          const SizedBox(width: 34,),
                          Icon(Icons.arrow_back_ios ,size: 10, color: Color(context.greyColor),),
                          context.text(text: "الموقع على الخريطة",
                              size: 10, color: context.greyColor ,wieght: FontWeight.w400),



                        ],),

                      ],)


                 ;
                }
                else {
                  return Center(
                    child: Column(
                      children: const [
                        Icon(Icons.warning, size: 80),
                        Text(
                          'NO DATA',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        )
                      ],
                    ),
                  );
                }

              }),

        ),


      ],
    );
  }

// void selectionChanged(DateRangePickerSelectionChangedArgs args) {
//   SchedulerBinding.instance!.addPostFrameCallback((duration) {
//   //  print(args.value);
//     setState(() {
//    _date=DateFormat('dd, MMMM yyyy').format(args.value).toString();
//     });
//   });
//  // print(_date);
// }
}
