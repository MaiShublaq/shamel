import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shamel/Controlleelper/controller_helper.dart';
import 'package:shamel/api/app/app_api.dart';
import 'package:shamel/models/Order.dart';
import 'package:shamel/models/notification.dart';
import 'package:shamel/models/order_type.dart';
class NotificationScreen extends StatefulWidget {
  NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late Future<List<NotificationData>> _notifuture;

  List<NotificationData> _notifications = <NotificationData>[];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _notifuture = AppApi().getNotification();  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:PreferredSize(preferredSize:const Size.fromHeight(80.0),
        child:
        AppBar(
          leading: IconButton(icon: const Icon(Icons.arrow_back_ios), onPressed: (){
            Navigator.pop(context);
          },),
          title:const Text("الإشعارات"),
          centerTitle: true,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)
              ,bottomRight: Radius.circular(20))),
          backgroundColor: Color(context.greenColor) ,),),
      body:FutureBuilder<List<NotificationData>>(
          future:_notifuture,
          builder: (context,snapshot){
            print(snapshot.data);
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              _notifications = snapshot.data ?? [];
              return ListView.builder(
                  physics:const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.all(22),
                  itemCount: _notifications.length,
                  itemBuilder:( context ,index){
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.notifications_none_sharp ,color: Colors.black, size: 22,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            context.text(text:_notifications[index].description!, size: 13, color: context.blackColor,wieght: FontWeight.w400),
                            context.text(text: _notifications[index].title!, size: 14, color: context.blackColor ,wieght: FontWeight.w500),
                            const SizedBox(height: 20,)
                          ],)

                      ],);

                  });}
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

          })



    );
  }

  }














