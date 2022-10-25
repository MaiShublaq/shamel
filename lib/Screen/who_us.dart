import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamel/Controlleelper/controller_helper.dart';
class WhoUs extends StatelessWidget {
  const WhoUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize:const Size.fromHeight(80.0),
        child:
        AppBar(
          leading: IconButton(icon: const Icon(Icons.arrow_back_ios), onPressed: (){
            Navigator.pop(context);
          },),
          title:const Text("من نحن"),
          centerTitle: true,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)
              ,bottomRight: Radius.circular(20))),
          backgroundColor: Color(context.greenColor) ,),),

      body: ListView(
        padding:const EdgeInsets.symmetric(horizontal: 21),
        children: [


           const SizedBox(height: 30,),
        context.text(text: "مبادرة شمل احدى مبادرات العدال السعودية لبرنامج التحول الوطني ."
      , size: 15, color: context.blackColor ,wieght: FontWeight.bold ,align: TextAlign.start),


          const SizedBox(height: 30,),
        context.text(text: "معلومات عامه حول التطبيق-"
            , size: 16, color: context.blackColor ,wieght: FontWeight.bold ,align: TextAlign.start),
        context.text(text: "مبادرة شمل احدى مبادرات العدال السعودية لبرنامج التحول الوطني مبادرة شمل احدى مبادرات العدال السعودية لبرنامج التحول الوطني مبادرة شمل احدى مبادرات العدال السعودية لبرنامج التحول الوطني."
            , size: 15, color: context.blackColor ,wieght: FontWeight.w400 ,align: TextAlign.start),

          const SizedBox(height: 30,),
          context.text(text: "ما الهدف من التطبيق ؟-"
              , size: 16, color: context.blackColor ,wieght: FontWeight.bold ,align: TextAlign.start),
          context.text(text:
        "مبادرة شمل احدى مبادرات العدال السعودية لبرنامج التحول الوطني مبادرة شمل احدى مبادرات العدال السعودية لبرنامج التحول الوطني مبادرة شمل احدى مبادرات العدال السعودية لبرنامج التحول الوطني."
            , size: 15, color: context.blackColor ,wieght: FontWeight.w400 ,align: TextAlign.start),

          const SizedBox(height: 30,),
        context.text(text: "كيف يمكننا مساعدتك ؟-"
            , size: 15, color: context.blackColor ,wieght: FontWeight.bold ,align: TextAlign.start),
        context.text(text: "مبادرة شمل احدى مبادرات العدال السعودية لبرنامج التحول الوطني مبادرة شمل احدى مبادرات العدال السعودية لبرنامج التحول الوطني."
            , size: 15, color: context.blackColor ,wieght: FontWeight.w400 ,align: TextAlign.start),

          const SizedBox(height: 30,),
          context.text(text: "لتجنب المشاكل في التطبيق"
            , size: 15, color: context.blackColor ,wieght: FontWeight.bold ,align: TextAlign.start),
        context.text(text: "قم بمشاهدة شرح استخدام التطبيق قبل الشحن -"
            , size: 15, color: context.blackColor,wieght: FontWeight.w400 ,align: TextAlign.start),

          const SizedBox(height: 30,),
          context.text(text: "يجب التأكد من الحساب أن يكون عام وليس خاصاً لتصلك كل طلباتك بشكل سليم وسريع"
            , size: 15, color: context.blackColor,wieght: FontWeight.bold ,align: TextAlign.start),

          const SizedBox(height: 30,),
        context.text(text: "عدم ازعاج فريق الدعم بأي اسأله لاتخص التطبيق -"
            , size: 15, color: context.blackColor,wieght: FontWeight.bold ,align: TextAlign.start),

          const SizedBox(height: 30,),
          context.text(text: "- أن كنت داخل العراق لاتحاول الشحن بكارتات تعبئه لاتعمل ذلك يؤدي الى اغلاق حسابك"
            , size: 15, color: context.blackColor ,wieght: FontWeight.bold ,align: TextAlign.start),

      ],),
    );
  }
}
