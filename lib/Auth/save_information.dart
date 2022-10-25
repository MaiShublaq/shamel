import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamel/Widget/text_field.dart';
import 'package:shamel/Controlleelper/controller_helper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shamel/api/app/app_api.dart';
import 'package:shamel/api/auth/auth_api_controller.dart';
import 'package:shamel/models/City.dart';
import 'package:shamel/models/user.dart';
import 'package:shamel/prefs/shared_pref_controller.dart';

class SaveInformation extends StatefulWidget {
  const SaveInformation({Key? key}) : super(key: key);

  @override
  State<SaveInformation> createState() => _SaveInformationState();
}

class _SaveInformationState extends State<SaveInformation> {
      late TextEditingController _nameController =new TextEditingController() ;
      late TextEditingController _dateOfBirthController =new TextEditingController();
      late TextEditingController _addressController =new TextEditingController();
      late TextEditingController _idNumberController =new TextEditingController();
      late TextEditingController _phoneNmberController =new TextEditingController();
      late TextEditingController _emailController =new TextEditingController();
      late TapGestureRecognizer _tapGestureRecognizer;


      late Future<List<City>> _cityfuture;
      List<City> _cities = <City>[];
      int? _id ;



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
    _cityfuture = AppApi().getCities();
    _tapGestureRecognizer = TapGestureRecognizer();
    _tapGestureRecognizer.onTap = onTap;
  }
      void onTap() {
        Navigator.pushNamed(context, '/methaq');
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
      appBar: PreferredSize(preferredSize:const Size.fromHeight(20.0),
        child:
        AppBar(
          leading: IconButton(icon:const Icon(Icons.arrow_back_ios,color:Colors.green), onPressed: (){
            Navigator.pushNamed(context,'/bot');
          },)
          ,),),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 22.w),
        children: [
        const  SizedBox(height: 46,),
          Center(
            child: Image(
                height:36.h ,
                width: 88.w,
                image: const AssetImage("images/logo.png")),
          ),
          SizedBox(height: 13.h,),
          context.text(text: "تحديث البيانات", size: 18, color: context.greenColor),
          SizedBox(height: 28.h,),
          context.text(text: "نرجو منك تحديث بياناتك في حال طرأ تغير عليها*", size: 13, color: context.blackColor
              ,align: TextAlign.start ,wieght: FontWeight.w300),

          //name
          SizedBox(height: 10.h,),
          context.text(text: "الاسم", size: 12, color: (0xFF757575)  ,align: TextAlign.start),
          SizedBox(height: 11.h,),
          text_field(controller: _nameController ,keybord: TextInputType.text, errorText1: nameErorr,),

          //Birthday
          SizedBox(height: 10.h,),
          context.text(text: "تاريخ الميلاد", size: 12, color: (0xFF757575) ,align: TextAlign.start),
          SizedBox(height: 11.h,),
          text_field(controller: _dateOfBirthController ,keybord: TextInputType.text, errorText1: dateErorr,),

          //id
          SizedBox(height: 10.h,),
          context.text(text: "رقم الهوية ", size: 12, color: (0xFF757575) ,align: TextAlign.start),
          SizedBox(height: 11.h,),
          text_field(controller: _idNumberController ,keybord: TextInputType.number, errorText1: idNumberErorr,),

          //phone Number
          SizedBox(height: 10.h,),
          context.text(text: "رقم الجوال", size: 12, color: (0xFF757575) ,align: TextAlign.start),
          SizedBox(height: 11.h,),
          text_field(controller: _phoneNmberController ,keybord: TextInputType.number, errorText1: phoneErorr,),


          //email
          SizedBox(height: 10.h,),
          context.text(text: "الايميل", size: 12, color: (0xFF757575) ,align: TextAlign.start),
          SizedBox(height: 11.h,),
          text_field(controller: _emailController ,keybord: TextInputType.emailAddress, errorText1: emailErorr,),


          //address
          SizedBox(height: 10.h,),
          context.text(text: "العنوان", size: 12, color: (0xFF757575) ,align: TextAlign.start),
          SizedBox(height: 11.h,),
          FutureBuilder<List<City>>(
              future:_cityfuture,
              builder: (context,snapshot){
                print(snapshot.data);
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  _cities=snapshot.data??[];
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
                    child: DropdownButton<int>(
                        icon: const Icon(Icons.arrow_drop_down_sharp ,color: Colors.black,size: 20,),
                        isExpanded: true,
                        hint: const Text("العنوان "),
                        style: GoogleFonts.ultra(fontSize: 13 ,fontWeight: FontWeight.w300 ,color:Color( context.greenColor)),
                        value: _id ,
                        onChanged: (int? vlaue) {
                          setState(() => _id = vlaue
                          );},
                        items: _cities.map((City) =>
                            DropdownMenuItem<int>(
                              child: Text(City.name!),
                              value: City.id,
                            ))
                            .toList()),

                  );
                }
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

              }),

          SizedBox(height: 24.h,),
          Row(
            children: [
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    //    text: AppLocalizations.of(context)!.haveAccount,
                      text: 'إقرار ميثاق المستفيد',
                      style: const TextStyle(color: Colors.black,),
                      recognizer: _tapGestureRecognizer

                    //  children: [
                //    const TextSpan(text: ' '),
                //    TextSpan(
                //      //   text: AppLocalizations.of(context)!.create,
                //        text: ' Create now',
                //        style: const TextStyle(color: Colors.lightBlueAccent),
                //        recognizer: _tapGestureRecognizer
                //    )
                //  ]
                  )),
            ],
          ),
          Center(child:
          _isLoading?ElevatedButton.icon(onPressed: (){}, label: Text(''),icon: CircularProgressIndicator(),)
         : ElevatedButton(
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
                  text: "تحديث", size: 15, color: context.wihteColor)))
        ],),
    );
  }
  void performUpdate(){
    if(checkData()){
   //   updateInformation();
    }
  }
  bool checkData(){
    checkTextFiled1();
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
       print(user.image);
       print(user.token);

       //bool status= await AuthApiController().updateProfile(context, user: user, );
      // if(status) Navigator.pushReplacementNamed(context, '/bot');
     }

     User get user{
       User user = User();
       user.name=_nameController.text;
       user.mobile=_phoneNmberController.text;
       user.email=_emailController.text;
       user.city=_id.toString();
       user.birthDate=_dateOfBirthController.text;
       user.nationalId=_idNumberController.text;
       user.nationality=SharedPrefController().nationality;
       user.token=SharedPrefController().token;
       user.image=SharedPrefController().image;
       user.genderType=SharedPrefController().genderType;

       return user;


     }

  }
