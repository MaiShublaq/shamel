import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamel/Auth/reset_new_pass.dart';
import 'package:shamel/Controlleelper/controller_helper.dart';
import 'package:shamel/api/api_helpers.dart';
import 'package:shamel/api/auth/auth_api_controller.dart';

class EnterPassCode extends StatefulWidget {
  const EnterPassCode({Key? key ,required this.nationalId}) : super(key: key);
  final String nationalId;

  @override
  State<EnterPassCode> createState() => _EnterPassCodeState();
}

class _EnterPassCodeState extends State<EnterPassCode> with ApiHelpers {


 late TextEditingController number1 , number2 ,number3, number4;
 late String _code;
 bool _isLoading = false;
 void _startLoading() async {
   setState(() {
     _isLoading = true;
   });
   await Future.delayed(const Duration(seconds: 3));

   setState(() {
     _isLoading = false;
   });
 }

 @override
 void initState() {
   super.initState();
   number1 = TextEditingController();
   number2 = TextEditingController();
   number3 = TextEditingController();
   number4 = TextEditingController();
 }
 @override
 void dispose() {
   number1.dispose();
   number2.dispose();
   number3.dispose();
   number4.dispose();

   super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(onPressed: (){
        Navigator.pop(context);
      },
        icon:const Icon(Icons.arrow_back_ios ,color: Colors.black,size: 16,),),
          title:const Text( "استرجاع كلمة المرور" ,style: TextStyle(fontSize: 17 ,color: Colors.black),)),

      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 35.w),
        children: [
         const SizedBox(height: 150,),
          context.text(text: "تحقق",
              size: 18, color: context.blackColor ,
              wieght: FontWeight.bold ,align: TextAlign.start),
          context.text(text: "سيتم ارسال كود التحقق لك على الايميل الخاص بك",
              size: 13, color: (0xFF747474) ,align: TextAlign.start, wieght: FontWeight.w400),
         const SizedBox(height: 12,),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               contaner(controller: number1,),
               contaner(controller: number2,),
               contaner(controller: number3,),
               contaner(controller: number4,),
             ],),
         const SizedBox(height: 23,),
          Row( mainAxisAlignment: MainAxisAlignment.center,
            children: [
            context.text(text: "أرسل الكود مرة أخرى", size: 14, color:context.greyColor),
            const SizedBox(width: 20,),
      //   context.text(text: startTimer(), size: 14, color: context.greenColor),
          ],),
          const SizedBox(height: 23,),
          Center(child: _isLoading?ElevatedButton.icon(onPressed: (){}, label: Text(''),icon: CircularProgressIndicator(),)
          :ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(context.greenColor),
                minimumSize: Size(175.w , 40.h),
                maximumSize: Size(175.w , 40.h),
                alignment: AlignmentDirectional.center,
                padding: const EdgeInsets.symmetric(horizontal: 10),
              ),
              onPressed: ()async{
                _isLoading?null
               : performForgetPassword();
              },
              child: context.text(
                  text: "تحقق", size: 15, color: context.wihteColor)),)

        ],
      ),
    );
  }

 Future<void> performForgetPassword() async {
   if (checkCode()) {
     await forgetPassword();
   }
 }




 bool checkCode(){
   print('in checkcODE');
   print(number1.text);
print('f')   ;
(number1.text.isNotEmpty)?print('true'):print('false');

   if(number1.text.isNotEmpty &&
       number2.text.isNotEmpty&&
       number3.text.isNotEmpty&&
       number4.text.isNotEmpty){
     print('in if');
     getVerificationCode();
     print('after beri');
     print(_code);
     return true;
   }

   showSnackBar(context: context, message: 'Enter verification code',error:true);
   return false;

 }
 String getVerificationCode(){
   print('in veri');
   return _code= (number4.text +
       number3.text+
       number2.text+
       number1.text);
 }


 Future<void> forgetPassword() async{
   print('in forget enter');
   print(_code);
   bool status = await AuthApiController().CheckCode(
     context,
     code:_code,
   );
   Navigator.pushReplacement(
     context,
     MaterialPageRoute(
       builder: (context) =>
           ResetNewPassword(nationalId: widget.nationalId),
     ),
   ); }







}

class contaner extends StatelessWidget {

 final TextEditingController? controller;
   contaner({
    Key? key,
    this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 50.w,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xFFB8B8B8) ,width: 1),
        borderRadius: BorderRadius.circular(13.r),
      ),
      child:  TextField(
       //  maxLength: 1,

      controller: controller,
        keyboardType: TextInputType.number,
        decoration:  InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)
            ),
            constraints: BoxConstraints(minHeight: 42 ,maxHeight: 42),
        ),
      ),
    );
  }
}
