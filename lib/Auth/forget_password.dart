import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamel/Auth/enter_pass_code.dart';
import 'package:shamel/Controlleelper/controller_helper.dart';
import 'package:shamel/api/auth/auth_api_controller.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key,required this.nationalId}) : super(key: key);
  final String nationalId;


  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {

 late TextEditingController _mobileController ;
  String? emailText ;
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
    _mobileController = TextEditingController();
  }
  @override
  void dispose() {
    _mobileController.dispose();
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
        padding: EdgeInsets.symmetric(horizontal: 22.w),
        children: [
        const  SizedBox(height: 15,),
          context.text(text: "هل نسيت كلمة المرور؟",
              size: 16, color: context.blackColor ,
              wieght: FontWeight.w500 ,align: TextAlign.start),
          const SizedBox(height: 12,),
          context.text(text: "الرجاء إدخال رقم الجوال الخاص بك وسنرسل لك كود",
              size: 14, color: context.blackColor ,
              wieght: FontWeight.w400 ,align: TextAlign.start),

          const SizedBox(height: 27),
          context.text(text: "رقم الجوال",
              size: 14, color: context.greenColor ,
              wieght: FontWeight.w400 ,align: TextAlign.start),
          const SizedBox(height: 12),

          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow:const [
                BoxShadow(
                    offset: Offset(0, 1),
                    color: Colors.black12,
                    blurRadius: 5)
              ],
            ),
            child: TextField(
              controller: _mobileController ,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)
                ),
                constraints: BoxConstraints(minHeight: 42 ,maxHeight: 42),
                hintText: "أدخل رقم الجوال الخاص بك",
                hintStyle: TextStyle(fontSize: 12 ,color: Colors.grey)
              ),
            ),
          ),
          const SizedBox(height: 32),
          Center(child:  _isLoading?ElevatedButton.icon(onPressed: (){}, label: Text(''),icon: CircularProgressIndicator(),)
         : ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(context.greenColor),
                minimumSize: Size(175.w , 40.h),
                maximumSize: Size(175.w , 40.h),
                elevation: 2,
                alignment: AlignmentDirectional.center,
                padding: const EdgeInsets.symmetric(horizontal: 10),),
              onPressed: (){
                _isLoading?null
                :resetNewPass();
              },
              child: context.text(
                  text: "التالي", size: 15, color: context.wihteColor))),

        ],),
    );
  }
  void resetNewPass(){
    if(checkDate()){
      reset();
    }
  }
  bool checkDate(){
    if(_mobileController.text.isNotEmpty){
      return true;
    }
    emailText = _mobileController.text.isEmpty ? 'هذا الحقل مطلوب!' : null;
    return false;
  }

    Future<void> reset() async{
    print('in reset');
      bool status = await AuthApiController().forgetPassword(
        context,
        mobile: _mobileController.text,
      );
      // if (status) Navigator.pushReplacementNamed(context, '/reset_password_screen');
      if (status) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                EnterPassCode(nationalId: widget.nationalId),
          ),
        );

    }
 }
}
