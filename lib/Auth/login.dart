import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamel/Auth/enter_pass_code.dart';
import 'package:shamel/Auth/forget_password.dart';
import 'package:shamel/Widget/text_field.dart';
import 'package:shamel/Controlleelper/controller_helper.dart';
import 'package:shamel/api/auth/auth_api_controller.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  late TextEditingController _passwordController, _idController;

  String? passwordErorr ,idErorr;
  bool _obsecure = true;

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
    _idController = TextEditingController();
    _passwordController = TextEditingController();
  }
  @override
  void dispose() {
    _idController.dispose();
    _passwordController.dispose();

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(

           padding: EdgeInsets.symmetric(horizontal: 21.w),
        children: [
        SizedBox(height: 187.h,),
        Center(
          child: Image(
              height:39.h ,
              width: 96.w,
              image: const AssetImage("images/logo.png")),
        ),
        SizedBox(height: 29.h,),
        Center(child: context.text(text: "تسجيل الدخول", size: 18, color: context.greenColor),),
          SizedBox(height: 44.h,),

        //email
        context.text(text: "رقم الهوية", size: 14, color: context.greenColor,align: TextAlign.right),
        SizedBox(height: 11.h,),
      TextField(
        keyboardType:TextInputType.text,
        controller: _idController,
        decoration: InputDecoration(
         // hintText: "ادخل الايميل الالكتروني الخاص بك",
          hintText: "أدخل رقم الهوية الخاص بك",

        hintStyle: TextStyle(
              color: Color(context.greyColor) , fontSize: 12 ),
          errorText:idErorr,
          constraints: BoxConstraints(maxHeight: idErorr== null? 42.h : 75.h ,maxWidth: 341.w),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.r),
            borderSide: BorderSide(color: Colors.red, width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1.0, color: Color(context.greyColor)),
            borderRadius: BorderRadius.circular(7.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.r),
            borderSide: BorderSide(color: Color(context.greenColor), width: 1.0),
          ),
        ),
        enabled: true,

      ),

        //email
        SizedBox(height: 24.h,),
        context.text(text: "كلمة المرور", size: 14, color: context.greenColor ,align: TextAlign.right),
        SizedBox(height: 11.h,),
          TextField(
            obscureText: _obsecure,
         //   keyboardType:TextInputType.number,
            controller: _passwordController,
            decoration: InputDecoration(
              suffixIcon: IconButton(icon: Icon(Icons.remove_red_eye ),onPressed: (){
                setState(() {
                  _obsecure = !_obsecure;
                  Icon(Icons.visibility_off );

                });
              },),
              hintText: "ادخل كلمة المرور",
              hintStyle: TextStyle(
                  color: Color(context.greyColor) , fontSize: 12 ),

              errorText:passwordErorr,
              constraints: BoxConstraints(maxHeight: passwordErorr== null? 42.h : 75.h ,maxWidth: 341.w),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7.r),
                borderSide: BorderSide(color: Colors.red, width: 1.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1.0, color: Color(context.greyColor)),
                borderRadius: BorderRadius.circular(7.r),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7.r),
                borderSide: BorderSide(color: Color(context.greenColor), width: 1.0),
              ),
            ),
            enabled: true,

          ),

        Row(children: [
          TextButton(
              onPressed: (){
                if(_idController.text.isNotEmpty){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ForgetPassword(nationalId: _idController.text),
                    ),
                  );
                }

                else{
                  setState(() {
                    idErorr = _idController.text.isEmpty ? 'ادخل رقم هوية المستخدم': null;
                  });
                }

                },
              child:context.text(text: "نسيت كلمة المرور", size: 10, color: context.greenColor ,align: TextAlign.center) )
        ],),
      const  SizedBox(height: 23,),
        Center(child:  _isLoading?ElevatedButton.icon(onPressed: (){}, label: Text(''),icon: CircularProgressIndicator(),)
       : ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(context.greenColor),
                minimumSize: Size(175.w , 40.h),
                maximumSize: Size(175.w , 40.h),
                elevation: 2,
                alignment: AlignmentDirectional.center,
                padding: const EdgeInsets.symmetric(horizontal: 10),

              ),
              onPressed: (){
                _isLoading?null
                :performLogin();
              },
              child: context.text(
                  text: "تسجيل دخول", size: 15, color: context.wihteColor)),)

      ],),
    );
  }

  Future<void> performLogin() async{
    if(checkdate()){
     await login();
    }
  }

  bool checkdate(){
    print('inchek data');
    setState(() {
      passwordErorr = _passwordController.text.isEmpty ? 'كلمة السر خطا حاول مرة اخرى' : null;
      idErorr = _idController.text.isEmpty ? 'ادخل رقم هوية المستخدم': null;
    });
    if(_idController.text.isNotEmpty && _passwordController.text.isNotEmpty){
      return true;
    }
    setState(() {
      passwordErorr = _passwordController.text.isEmpty ? 'كلمة السر خطا حاول مرة اخرى' : null;
      idErorr = _idController.text.isEmpty ? 'ادخل رقم هوية المستخدم': null;
    });
    return false;
  }

  Future<void> login() async{
    print('in login');
    bool status = await AuthApiController().login(
      context,
      national_id: _idController.text,
      password: _passwordController.text,
    );

    if (status){
      Navigator.pushNamed(context, '/save_information');
    }
  }
}
