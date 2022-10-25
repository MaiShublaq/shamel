import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shamel/Widget/text_field.dart';
import 'package:shamel/Controlleelper/controller_helper.dart';
import 'package:shamel/api/auth/auth_api_controller.dart';
import 'package:shamel/models/user.dart';
import 'package:shamel/prefs/shared_pref_controller.dart';

class UpdateInformation extends StatefulWidget {
  const UpdateInformation({Key? key}) : super(key: key);

  @override
  State<UpdateInformation> createState() => _UpdateInformationState();
}

class _UpdateInformationState extends State<UpdateInformation> {
   PickedFile? _imageFile;
  final ImagePicker  _picker=ImagePicker();

   late TextEditingController _nameController =new TextEditingController() ;
   late TextEditingController _dateOfBirthController =new TextEditingController();
   late TextEditingController _addressController =new TextEditingController();
   late TextEditingController _idNumberController =new TextEditingController();
   late TextEditingController _phoneNmberController =new TextEditingController();
   late TextEditingController _emailController =new TextEditingController();


  String? nameErorr , dateErorr , addressErorr , idNumberErorr , phoneErorr ,emailErorr;
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
    _nameController.text = SharedPrefController().name;
    _dateOfBirthController.text =SharedPrefController().birthDate ;
    _idNumberController.text = SharedPrefController().nattionalId;
    _phoneNmberController.text =SharedPrefController().mobile;
    _emailController.text = SharedPrefController().email;
    _addressController.text = SharedPrefController().city;

  }
  @override
  void dispose() {
    _nameController.dispose();
    _dateOfBirthController.dispose();
    _idNumberController.dispose();
    _phoneNmberController.dispose();
    _emailController.dispose();
    _addressController.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize:const Size.fromHeight(80.0),
        child:
        AppBar(
          leading: IconButton(icon:const Icon(Icons.arrow_back_ios), onPressed: (){
            Navigator.pop(context);
          },),
          title: context.text(text: "تعديل المعلومات الشخصية", size: 20, color: context.wihteColor),
          centerTitle: true,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)
              ,bottomRight: Radius.circular(20))),
          backgroundColor: Color(context.greenColor) ,),),
      body: ListView(
        padding: EdgeInsets.only(top: 16 ,left: 22 ,right: 22),

        children: [
        Center(
          child: Stack(
            children: [
               CircleAvatar(radius: 40,
                  backgroundColor: Colors.transparent,
                  backgroundImage:
              _imageFile==null
              ? AssetImage(SharedPrefController().image.replaceFirst('{upload}', '')) as ImageProvider
              :FileImage(File(_imageFile!.path)
              )


               ) ,
              Positioned(
                 left: 55,
                  top: 50,
                  child: CircleAvatar(
                    radius: 11,
                    backgroundColor: Color(context.greenColor),
                    child:  IconButton(onPressed: () async{
                      print(SharedPrefController().image);
                    final pickedFile= await _picker.getImage(source: ImageSource.gallery);
                    if(pickedFile!=null){
                      setState(() {
                        _imageFile=pickedFile;
                      });
                    }


                    },icon:
                    const Icon(Icons.edit ,size: 9,),color: Colors.white,),
                  )),

            ],
          ),
        ),
      const SizedBox(height: 18,),
        context.text(text: "الاسم", size: 12, color: (0xFF707070) ,align: TextAlign.start),
        const SizedBox(height: 11,),
        text_field(controller: _nameController ,keybord: TextInputType.text, errorText1: nameErorr,),

          const SizedBox(height: 18,),
          context.text(text: "تاريخ الميلاد", size: 12, color: (0xFF707070) ,align: TextAlign.start),
          const SizedBox(height: 11,),
          text_field(controller: _dateOfBirthController ,keybord: TextInputType.text, errorText1: dateErorr,),

          const SizedBox(height: 18,),
          context.text(text: "رقم الهوية", size: 12, color: (0xFF707070) ,align: TextAlign.start),
          const SizedBox(height: 11,),
          text_field(controller: _idNumberController ,keybord: TextInputType.number, errorText1: idNumberErorr,),

          const SizedBox(height: 18,),
          context.text(text: "رقم الجوال", size: 12, color: (0xFF707070) ,align: TextAlign.start),
          const SizedBox(height: 11,),
          text_field(controller: _phoneNmberController ,keybord: TextInputType.number, errorText1: phoneErorr, ),


          const SizedBox(height: 18,),
          context.text(text: "الايميل", size: 12, color: (0xFF707070) ,align: TextAlign.start),
          const SizedBox(height: 11,),
          text_field(controller: _emailController ,keybord: TextInputType.emailAddress, errorText1: emailErorr,),

          const SizedBox(height: 18,),
          context.text(text: "العنوان", size: 12, color: (0xFF707070) ,align: TextAlign.start),
          const SizedBox(height: 11,),
          text_field(controller: _addressController ,keybord: TextInputType.text, errorText1: addressErorr,),

          const SizedBox(height: 24,),
         Center(child: _isLoading?ElevatedButton.icon(onPressed: (){}, label: Text(''),icon: CircularProgressIndicator(),)
         :ElevatedButton(
               style: ElevatedButton.styleFrom(
                 primary: Color(context.greenColor),
                 minimumSize: Size(175.w , 40.h),
                 maximumSize: Size(175.w , 40.h),
                 alignment: AlignmentDirectional.center,
                 padding: const EdgeInsets.symmetric(horizontal: 10),
               ),
               onPressed: (){
                 _isLoading?null
                 :performUpdate();
               },
               child: context.text(
                   text: "تعديل", size: 15, color: context.wihteColor)),)


        ],)
    );
  }
  void performUpdate(){
    if(checkData()){
      print('inCheck');
      updateInformation();

    }
  }
  bool checkData(){
    if(_nameController.text.isNotEmpty && _emailController.text.isNotEmpty && _addressController.text.isNotEmpty
        && _phoneNmberController.text.isNotEmpty && _dateOfBirthController.text.isNotEmpty && _idNumberController.text.isNotEmpty){
      return true;
    }
    checkTextFiled1();
    context.snackBar(massage: "enter the value", error: true);
    return false;
  }
  void checkTextFiled1() {
    setState(() {
      nameErorr = _nameController.text.isEmpty ? ' اسم المتخدم مطلوب ' : null;
      emailErorr = _emailController.text.isEmpty ? 'ايميل المستخدم مطلوب': null;
      addressErorr = _addressController.text.isEmpty ? 'العنوان مطلوب': null;
      idNumberErorr = _idNumberController.text.isEmpty ? 'رقم الهوية مطلوب': null;
      phoneErorr = _phoneNmberController.text.isEmpty ? 'رقم الهاتف مطلوب': null;
      dateErorr = _dateOfBirthController.text.isEmpty ? 'تاريخ الميلاد مطلوب': null;

    });
  }



   Future<void> updateInformation() async{

      await AuthApiController().updateProfile(context, user: user, pickedFile: _imageFile!);

     SharedPrefController().save( user: user,);
     Navigator.pushReplacementNamed(context, '/bot');
   }





   User get user{
     User user = User();
     user.name=_nameController.text;
     user.mobile=_phoneNmberController.text;
     user.email=_emailController.text;
     user.city=_addressController.text;
     user.birthDate=_dateOfBirthController.text;
     user.nationalId=_idNumberController.text;
     user.nationality=SharedPrefController().nationality;
     user.token=SharedPrefController().token;
     user.image= SharedPrefController().image;
     user.genderType=SharedPrefController().genderType;

     return user;


   }
}
