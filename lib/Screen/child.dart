import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamel/Controlleelper/controller_helper.dart';
import 'package:shamel/api/app/app_api.dart';
import 'package:shamel/models/children.dart';

class Child extends StatefulWidget {
  const Child({Key? key}) : super(key: key);

  @override
  State<Child> createState() => _ChildState();
}

class _ChildState extends State<Child> {
  late Future<List<Children>> _childrenfuture;
  List<Children> _children = <Children>[];

  void initState() {
    // TODO: implement initState
    super.initState();
    _childrenfuture = AppApi().getChildren();
  }

    List<String> _name = <String>[
    "أحمد محمد عبدالله",
    "محمود محمد عبدالله",
    "عبد الرحمن محمد عبدالله",
    "هند محمد عبدالله",
    "لجين محمد عبدالله"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:PreferredSize(preferredSize:const Size.fromHeight(80.0),
        child:
        AppBar(
          leading: IconButton(icon:const Icon(Icons.arrow_back_ios), onPressed: (){
            Navigator.pop(context);
          },),
          title: context.text(text: "الابناء", size: 20, color: context.wihteColor),
          centerTitle: true,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)
              ,bottomRight: Radius.circular(20))),
          backgroundColor: Color(context.greenColor) ,),),

      body:
      ListView(
        padding: EdgeInsets.symmetric(horizontal: 22),
        children: [
          const SizedBox(height: 23,),
          context.text(text: "الأبناء:", size: 14, color: context.blackColor ,align: TextAlign.start),
          FutureBuilder<List<Children>>(
              future:_childrenfuture,
              builder: (context,snapshot){
                print(snapshot.data);
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  _children = snapshot.data ?? [];
                  return  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _children.length,
                      itemBuilder: (context ,index){
                        return  Container(
                          margin: EdgeInsets.symmetric(vertical: 10.h),
                          padding: const EdgeInsets.symmetric(horizontal: 10 ,vertical: 5),
                          alignment: Alignment.center,
                          height: 48.h,
                          width: 350.w,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 1),
                                    color: Colors.black12,
                                    blurRadius: 5)
                              ],
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child:
                          Row(children: [
                            context.text(text:_children[index].fullName!, size: 14, color: context.blackColor),
                            Spacer(),
                            IconButton(onPressed: (){
                              showDailalog(context,
                                national_id: _children[index].nationalId!,
                                birth_date: _children[index].birthDate!,
                                age:_children[index].age!,
                              );
                            }, icon: Icon(Icons.arrow_left_outlined ,size: 24,))

                          ],),);
                      });

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

              })
        ],

      ),
    );
  }


  Future showDailalog(BuildContext context,{required national_id,required birth_date,required age}){
    return showDialog(context: context, builder: (context)=> AlertDialog(
      content: SizedBox(
        height: double.infinity,
        width : double.infinity,
        child: Stack(
            children:[
              Container(
                margin: EdgeInsets.only(top: 290.h),
                alignment: Alignment.center,
                  padding: EdgeInsets.all(12),
                  height: 184.h,

                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30)),

                  ),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children :[
                        const SizedBox(height: 20,),
                        Row(children: [
                          context.text(text: "رقم الهوية:", size: 13, color: (0xFF656565) ,wieght: FontWeight.w400),
                          Spacer(),
                          context.text(text:national_id, size: 13, color: context.greenColor ,wieght: FontWeight.w400),
                        ],),
                        const SizedBox(height: 10,),
                        const  Divider(height: 2, color: Color(0xFFE2E2E2), thickness: 1,),
                        const SizedBox(height: 10,),
                        Row(children: [
                          context.text(text: "تاريخ الميلاد :", size: 13, color: (0xFF656565) ,wieght: FontWeight.w400),
                          const  Spacer(),
                          context.text(text:birth_date, size: 13, color: context.greenColor ,wieght: FontWeight.w400),
                        ],),
                        const SizedBox(height: 10,),
                        const  Divider(height: 2, color: Color(0xFFE2E2E2), thickness: 1,),
                        const SizedBox(height: 10,),
                        Row(children: [
                          context.text(text: "العمر", size: 13, color: (0xFF656565) ,wieght: FontWeight.w400),
                          const  Spacer(),
                          context.text(text: age.toString(), size: 13, color: context.greenColor ,wieght: FontWeight.w400),
                        ],),


                      ])
              ),
             const Positioned(
                bottom: 405,
                left: 90,
                right: 90,
                child: CircleAvatar(
                  radius: 40,
                    backgroundImage:AssetImage("images/user1.png")) ,
              ),



            ]),
      ),
    ));


  }
}
