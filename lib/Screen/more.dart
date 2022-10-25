import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamel/Controlleelper/controller_helper.dart';
import 'package:shamel/api/auth/auth_api_controller.dart';
import 'package:shamel/prefs/shared_pref_controller.dart';

class More extends StatefulWidget {
  const More({Key? key}) : super(key: key);

  @override
  State<More> createState() => _ChildState();
}

class _ChildState extends State<More> {
  @override
  Widget build(BuildContext context) {
    return  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 146,
            padding: const EdgeInsets.only(top: 20),
            decoration: const BoxDecoration(
                color: Color(0xFF4F7F71),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20) ,
                    bottomRight: Radius.circular(20))
            ),

            child: Row(
              children: [
                const CircleAvatar(radius: 50,
                  backgroundColor: Colors.transparent,
                  backgroundImage:AssetImage("images/user.png")) ,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(SharedPrefController().name  , style: TextStyle(fontSize: 16 ,color: Colors.white)),
                    Text(SharedPrefController().nattionalId , style: TextStyle(fontSize: 16 ,color: Colors.white)),

                  ],)
              ],),
          ),

         const SizedBox(height: 20,),

          Container(
            margin:const EdgeInsets.symmetric(horizontal: 21),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

              TextButton(onPressed: (){
                Navigator.pushNamed(context, '/update_information');
              }, child: context.text(text: "تعديل المعلومات الشخصية", size: 15,
                  color: context.blackColor)),
                const   Divider(height: 10, thickness: 1,),

              TextButton(onPressed: (){
                Navigator.pushNamed(context, '/conect_with_us');

              }, child: context.text(text: "تواصل معنا", size: 15,
                  color: context.blackColor)),
                const  Divider(height: 10, thickness: 1,),

              TextButton(onPressed: (){
                Navigator.pushNamed(context, '/who_us');

              }, child: context.text(text: "من نحن", size: 15,
                  color: context.blackColor)),
                const  Divider(height: 10, thickness: 1,),

              TextButton(onPressed: (){
                Navigator.pushNamed(context, '/');

              }, child: context.text(text: "سياسة الاستخدام", size: 15,
                  color: context.blackColor)),
                const Divider(height: 10, thickness: 1.5,),

              TextButton(onPressed: ()async {
                print('in more');
                print(SharedPrefController().token);
              bool status = await AuthApiController().logout();
                if (status){
                Navigator.pushReplacementNamed(context, '/login');
                }
    }, child: context.text(text: "تسجيل خروج", size: 15,
                  color: context.blackColor)),



            ],),
          )

        ],

    );



  }
}
