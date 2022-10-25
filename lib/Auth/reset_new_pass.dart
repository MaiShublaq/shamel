import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamel/Controlleelper/controller_helper.dart';
import 'package:shamel/api/api_helpers.dart';
import 'package:shamel/api/auth/auth_api_controller.dart';
import 'package:shamel/prefs/shared_pref_controller.dart';
class ResetNewPassword extends StatefulWidget {
  const ResetNewPassword({Key? key,required this.nationalId}) : super(key: key);
  final String nationalId;

  @override
  State<ResetNewPassword> createState() => _ResetNewPasswordState();
}

class _ResetNewPasswordState extends State<ResetNewPassword> with ApiHelpers {

  late TextEditingController newPassController , newPassConfirmController;
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
    newPassController = TextEditingController();
    newPassConfirmController = TextEditingController();

  }
  @override
  void dispose() {
    newPassController.dispose();
    newPassConfirmController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title:const Text( "اعادة تعيين كلمة السر" ,style: TextStyle(fontSize: 17 ,color: Colors.black),)),
      body: ListView(
        padding: EdgeInsets.only(top: 22 ,right: 22 ,left: 22),
        children: [

        context.text(text: "أدخل كلمة السر الجديدة", size: 14, color: context.greenColor ,
        align: TextAlign.start ,wieght: FontWeight.normal),
        contaner_reset(controller: newPassController),
        const  SizedBox(height: 23,),
          context.text(text: "أدخل كلمة السر الجديدة مرة أخرى", size: 14, color: context.greenColor ,
              align: TextAlign.start ,wieght: FontWeight.normal),
        contaner_reset(controller: newPassConfirmController,),
          const  SizedBox(height: 32,),
          Center(child: _isLoading?ElevatedButton.icon(onPressed: (){}, label: Text(''),icon: CircularProgressIndicator(),)
         : ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(context.greenColor),
                minimumSize: Size(190.w , 40.h),
                maximumSize: Size(190.w , 40.h),
                elevation: 2,
                alignment: AlignmentDirectional.center,
                padding: const EdgeInsets.symmetric(horizontal: 10),),
              onPressed: (){
                _isLoading?null
                :performForgetPassword();
              },
              child: context.text(
                  text: "إعادة تسجيل الدخول", size: 15, color: context.wihteColor))),


        ],
      ),
    );
  }

  Future<void> performForgetPassword() async {
    if (checkPassword()) {
      await resetPassword();
    }
  }



  bool checkPassword() {
    print('inCheck');
    if (newPassController.text.isNotEmpty &&
        newPassConfirmController.text.isNotEmpty) {
      print('in first if');

      if(newPassController.text==newPassConfirmController.text){
        print('in 2 if');

        return true;
      }
      showSnackBar(context: context, message: 'password confirmation error',error:true);
      return false;
    }

    showSnackBar(context: context, message: 'Enter new password',error:true);
    return false; }




  Future<void> resetPassword() async{
    print('in reset ');
    print(widget.nationalId);
    print(SharedPrefController().nattionalId);

    bool status = await AuthApiController().resetPassword(
      context,
      nationalId: widget.nationalId,
      password:newPassController.text ,
    );
    if (status) Navigator.pushReplacementNamed(context, '/login');
  }

}

class contaner_reset extends StatelessWidget {
  final TextEditingController? controller;

  const contaner_reset({
    Key? key,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.only(top: 12),
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
      child:  TextField(
        controller: controller,
        obscureText: true,
        keyboardType: TextInputType.emailAddress,
        decoration:  InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent)),
          constraints: BoxConstraints(minHeight: 42 ,maxHeight: 42),
        ),
      ),
    );
  }
}
