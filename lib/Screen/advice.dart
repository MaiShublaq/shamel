import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamel/Controlleelper/controller_helper.dart';
class Advice extends StatelessWidget {
     const Advice({Key? key}) : super(key: key);

     @override
     Widget build(BuildContext context) {
       return Scaffold(
         extendBodyBehindAppBar: true,
         appBar:PreferredSize(preferredSize:const Size.fromHeight(80.0),
         child:
         AppBar(
           leading: IconButton(icon: const Icon(Icons.arrow_back_ios), onPressed: (){
             Navigator.pop(context);
           },),
           title:const Text("نصائح و ارشادات "),
           centerTitle: true,
           shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)
             ,bottomRight: Radius.circular(20))),
           backgroundColor: Color(context.greenColor) ,),),
         body: ListView(
           children: [
             Container(
               margin: EdgeInsets.symmetric(horizontal: 21),
               child: Column(
               mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
             const SizedBox(height: 32),
              context.text(text: "مبادرة شمل احدى مبادرات العدال السعودية لبرنامج التحول الوطني",
                  size: 14, color: context.blackColor ,wieght: FontWeight.w500 ,align: TextAlign.start),
             const SizedBox(height: 35),
             context.text(text: "النصيحة الأولى:",
                 size: 14, color: context.blackColor ,wieght: FontWeight.w400,align: TextAlign.start),
             context.text(text: "مبادرة شمل احدى مبادرات العدال السعودية لبرنامج التحول الوطني مبادرة شمل احدى مبادرات العدال السعودية لبرنامج التحول الوطني مبادرة شمل احدى مبادرات العدال السعودية لبرنامج التحول الوطني.",
                 size: 15, color: context.blackColor ,wieght: FontWeight.w400,align: TextAlign.start),

             const SizedBox(height: 35),
             context.text(text: "النصيحة الثانية:",
                 size: 14, color: context.blackColor ,wieght: FontWeight.w400,align: TextAlign.start),
             context.text(text: "مبادرة شمل احدى مبادرات العدال السعودية لبرنامج التحول الوطني.",
                 size: 14, color: context.blackColor ,wieght: FontWeight.w400 ,align: TextAlign.start),
                   const SizedBox(height: 2,),
             context.text(text: "مبادرة شمل احدى مبادرات العدال السعودية لبرنامج التحول الوطني مبادرة شمل احدى مبادرات العدال السعودية لبرنامج التحول الوطني .",
                 size: 15, color: context.blackColor ,wieght: FontWeight.w400,align: TextAlign.start),

                   const SizedBox(height: 35),
                   context.text(text: "كيف يمكننا مساعدتك ؟-",
                       size: 14, color: context.blackColor ,wieght: FontWeight.w400,align: TextAlign.start),
                   context.text(text: "مبادرة شمل احدى مبادرات العدال السعودية لبرنامج التحول الوطني مبادرة شمل احدى مبادرات العدال السعودية لبرنامج التحول الوطني.",
                       size: 14, color: context.blackColor ,wieght: FontWeight.w400,align: TextAlign.start),

                   const SizedBox(height: 35),
                   context.text(text: "النصيحة الثالثة",
                       size: 14, color: context.blackColor ,wieght: FontWeight.w400,align: TextAlign.start),
                   context.text(text: "قم بمشاهدة شرح استخدام التطبيق قبل الشحن -",
                       size: 14, color: context.blackColor ,wieght: FontWeight.w400,align: TextAlign.start),

                   const SizedBox(height: 35),
                   context.text(text: "يجب التأكد من الحساب أن يكون عام وليس خاصاً لتصلك كل طلباتك بشكل سليم وسريع",
                       size: 14, color: context.blackColor ,wieght: FontWeight.w400,align: TextAlign.start),
                   const SizedBox(height: 35),
                   context.text(text: "عدم ازعاج فريق الدعم بأي اسأله لاتخص التطبيق -",
                       size: 14, color: context.blackColor ,wieght: FontWeight.w400,align: TextAlign.start),

                   const SizedBox(height: 35),
                   context.text(text: "أن كنت داخل العراق لاتحاول الشحن بكارتات تعبئه لاتعمل ذلك يؤدي الى اغلاق حسابكة",
                       size: 14, color: context.blackColor ,wieght: FontWeight.w400,align: TextAlign.start),

                 ],),)
           ],
         ),
       );
     }
   }

