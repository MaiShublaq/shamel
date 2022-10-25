import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamel/Controlleelper/controller_helper.dart';
import 'package:shamel/api/app/app_api.dart';
import 'package:shamel/models/methaq.dart';
class MethaqScreen extends StatefulWidget {
   MethaqScreen({Key? key}) : super(key: key);

  @override
  State<MethaqScreen> createState() => _MethaqScreenState();
}

class _MethaqScreenState extends State<MethaqScreen> {
  late Future<Methaq> _methaqFuture;

   late Methaq _methaq;

   @override
   void initState() {
     // TODO: implement initState
     super.initState();
     _methaqFuture = AppApi().getMethaq();

   }

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

      body:FutureBuilder<Methaq>(
          future:_methaqFuture,
          builder: (context,snapshot){
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasData) {
              print('heeere');
              return ListView(
                  padding:const EdgeInsets.symmetric(horizontal: 21),
                  children: [
                    Text(snapshot.data!.title!),
                    SizedBox(height: 15,),
                    Text(snapshot.data!.body!)

                  ]
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

          })


    );
  }
}
