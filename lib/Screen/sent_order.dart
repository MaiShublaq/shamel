import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shamel/Controlleelper/controller_helper.dart';
import 'package:shamel/api/app/app_api.dart';
import 'package:shamel/models/Order.dart';
import 'package:shamel/models/order_type.dart';
class SentOrder extends StatefulWidget {
   SentOrder({Key? key}) : super(key: key);

  @override
  State<SentOrder> createState() => _SentOrderState();
}

class _SentOrderState extends State<SentOrder> {
  late TextEditingController noteController;
  late Future<List<Order>> _orderfuture;
  List<Order> _orders = <Order>[];


// List<OrderType> _order = <OrderType>[
//   OrderType(id: 1, name: "order 1"),
//   OrderType(id: 2, name: "order 2"),
//   OrderType(id: 3, name: "order 3"),
// ];

   int? _id ;
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
    // TODO: implement initState
    super.initState();
    _orderfuture = AppApi().getOrder();
    noteController = TextEditingController();
   }
   @override
  void dispose() {
    // TODO: implement dispose
     noteController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:PreferredSize(preferredSize:const Size.fromHeight(80.0),
        child:
        AppBar(
          leading: IconButton(icon: const Icon(Icons.arrow_back_ios), onPressed: (){
            Navigator.pop(context);
          },),
          title:const Text("ارسال الطلب "),
          centerTitle: true,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)
              ,bottomRight: Radius.circular(20))),
          backgroundColor: Color(context.greenColor) ,),),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 21),
        children: [
       const SizedBox(height: 30,),
        context.text(text: "نوع الطلب", size: 14, color: context.blackColor , align: TextAlign.start),
          FutureBuilder<List<Order>>(
              future:_orderfuture,
              builder: (context,snapshot){
                print(snapshot.data);
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  _orders=snapshot.data??[];
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
                        hint: const Text("نوع الطلب  "),
                        style: GoogleFonts.ultra(fontSize: 13 ,fontWeight: FontWeight.w300 ,color:Color( context.greenColor)),
                        value: _id ,
                        onChanged: (int? vlaue) {
                          setState(() => _id = vlaue
                          );},
                        items: _orders.map((Order) =>
                            DropdownMenuItem<int>(
                              child: Text(Order.title!),
                              value: Order.id,
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

          const SizedBox(height: 20,),
          context.text(text: "ملاحظات", size: 14, color: context.blackColor , align: TextAlign.start),
           TextField(
            controller: noteController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              constraints: BoxConstraints(minHeight: 122 ,minWidth: 344 ),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))
                  ,borderSide: BorderSide(color: Color(0xFF707070))),
            hintText: "اكتب ملاحظاتك.... " ,
              hintStyle: TextStyle(fontSize: 10 ,color: Color(0xFFA4A4A4)),

          ),),
          const  SizedBox(height: 32,),
          Center(child:
              _isLoading?ElevatedButton.icon(onPressed: (){}, label: Text(''),icon: CircularProgressIndicator(),)
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
                :peformSendOrder();
              },
              child: context.text(
                  text: "إرسال", size: 15, color: context.wihteColor))),

        ],),


    );
  }

  Future<void> peformSendOrder() async {
    if (check()) {
      await send();
    }
  }



  bool check() {
    print('inCheck');
    if (noteController.text.isNotEmpty &&
        _id!=null) {
      print('in first if');
      return true;
    }
    context.snackBar(massage: "enter the value", error: true);
    return false;
   }




  Future<void> send() async{

    print('in send ');

    bool status = await AppApi().sendOrder(
      context,
      request_id: _id!.toString(),
      note:noteController.text ,
    );
    if (status) Navigator.pushReplacementNamed(context, '/sent_order');
  }

}




