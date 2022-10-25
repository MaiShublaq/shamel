import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamel/Controlleelper/controller_helper.dart';

class OnBording extends StatefulWidget {
  const OnBording({Key? key}) : super(key: key);

  @override
  State<OnBording> createState() => _OnBordingState();
}

class _OnBordingState extends State<OnBording> {
  late PageController _pageController;
  int _curentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      child: Column(
          children: [
            SizedBox(height: 50,),
           Row(children: [
             Visibility(visible: _curentIndex < 2,
               child:
            TextButton(child: context.text(text: "تخطي",
                size: 16, color: context.greenColor),onPressed: (){
              _pageController.animateToPage(2, duration:const Duration(seconds: 2), curve: Curves.bounceOut);

            },),
             ),
             Spacer(),
           Image(
           height:32.h ,
           width: 80.w,
           image: AssetImage("images/logo.png")),
            Spacer()

],),
           Expanded(
             child: PageView(
               controller: _pageController,
               onPageChanged: (int page) {
                 setState(() => _curentIndex = page);
               },
               children: [
                 Column(
                   children: [
                     SizedBox(height: 214.h),
                   Image(
                     image: const AssetImage("images/on_bording1.png"),
                     alignment: AlignmentDirectional.center,
                     height: 228.h,
                     width: 260.w,
                   ),
                     SizedBox(height: 38.h,),
                     Padding(padding: EdgeInsets.symmetric(horizontal: 100.w),
                       child:context.text(
                           text: "يمكنك ارسال طلب لزيارة اطفالك وطلب طلبات أخرى",
                           size: 15,
                           color: (context.blackColor) ,wieght: FontWeight.w500),
                     )

                 ],),
                 Column(
                   children: [
                     SizedBox(height: 214.h),
                     Image(
                       image: const AssetImage("images/on_bording2.png"),
                       alignment: AlignmentDirectional.center,
                       height: 228.h,
                       width: 260.w,
                     ),
                     SizedBox(height: 38.h,),
                     Padding(padding: EdgeInsets.symmetric(horizontal: 65.w),
                       child:context.text(
                           text: "معلوماتك وخصوصتيك بأمان تام معلوماتك وخصوصتيك بأمان تام مع شمل",
                           size: 15,
                           color: (context.blackColor) ,wieght: FontWeight.w500),
                     )
                   ],),
                 Column(
                   children: [
                     SizedBox(height: 214.h),
                     Image(
                       image: const AssetImage("images/on_bording3.png"),
                       alignment: AlignmentDirectional.center,
                       height: 228.h,
                       width: 260.w,
                     ),
                     SizedBox(height: 38.h,),
                     Padding(padding: EdgeInsets.symmetric(horizontal: 81.w),
                       child:context.text(
                           text: "يمكنك رؤية جلساتك السابقة ومواعيد زياراتك لاطفالك",
                           size: 15,
                           color: (context.blackColor) ,wieght: FontWeight.w500),
                     ),

                   ]),

               ],
             ),
           ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal:_curentIndex==0? 0: 2),
                  height: 5.h,
                  width:_curentIndex==2? 28.w : 5.w,
                  decoration: BoxDecoration(
                    color: Color(context.greenColor),
                    borderRadius: BorderRadius.circular(2.5.r),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal:_curentIndex==0? 0: 2),
                  height: 5.h,
                  width:_curentIndex==1? 28.w : 5.w,
                  decoration: BoxDecoration(
                    color: Color(context.greenColor),
                    borderRadius: BorderRadius.circular(2.5.r),

                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: _curentIndex==1? 0: 2),
                  height: 5.h,
                  width: _curentIndex==0? 28.w : 5.w,
                  decoration: BoxDecoration(
                    color: Color(context.greenColor),
                    borderRadius: BorderRadius.circular(2.5.r),
                  ),
                ),
              ],),
            Row(
              children: [
                Visibility(visible: _curentIndex < 2,
                  child:  Container(
                      height: 52.h,
                      padding: EdgeInsets.only(right: 10),
                      alignment: Alignment.centerRight,
                      width: 80.w,
                      decoration: BoxDecoration(
                        color: Color(context.greenColor),
                        borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(40)),
                        border: Border.all(color: Color(context.wihteColor) ,width: 1),
                      ),
                      child:TextButton(onPressed: (){
                        _pageController.animateToPage(
                            _curentIndex == 0?  1 : 2, duration:const Duration(seconds: 2), curve: Curves.bounceOut);
                      }, child:
                      context.text(text: "التالي", size: 16, color: context.wihteColor),
                      )),

                  replacement: Container(
                    height: 52.h,
                    padding: EdgeInsets.only(right: 10),
                    alignment: Alignment.centerRight,
                    width: 80.w,
                    decoration: BoxDecoration(
                      color: Color(context.greenColor),
                      borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(40)),
                      border: Border.all(color: Color(context.wihteColor) ,width: 1),
                    ),
                    child: TextButton(onPressed: (){
                      Navigator.pushReplacementNamed(context, "/login");
                    },
                      child: context.text(text: "ابدأ الأن", size: 16, color: context.wihteColor),),
                  ),
                ),
                Spacer(),
                Visibility(
                    visible: _curentIndex == 1 ,
                    child: Container(
                        height: 52.h,
                        width: 80.w,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.only(topRight: Radius.circular(40)),
                          border: Border.all(color: Color(context.greenColor) ,width: 1),
                        ),
                        child: TextButton(onPressed: (){
                          _pageController.animateToPage(0, duration:const Duration(seconds: 2), curve: Curves.bounceOut);
                        },child: context.text(text: "السابق", size: 16, color: context.greenColor),)
                    ) ),

            ],)

          ],
        ),
      ),
    );
  }
}
