//import 'package:elancer_api/api/controllers/images_api_controller.dart';
//import 'package:elancer_api/models/student_images.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:get/get.dart';
//
//class ImageGetxController extends GetxController{
//  RxList<StudentImage> studentImages=<StudentImage>[].obs;
//  final ImagesApiController _imagesApiController=ImagesApiController();
//  static ImageGetxController get to=>  Get.find();
//
//
//  Future<void> read (BuildContext context) async{
//    studentImages.value= await ImagesApiController().images(context);
//  }
//
//  Future<void> uploadImage(BuildContext context,{required String path, required UploadImageCallBack uploadImageCallBack}) async{
//    await ImagesApiController().uploadImage(
//        context,
//        path: path,
//        uploadImageCallBack: ({required String message,required bool status,studentImage}){
//          if(status){
//            studentImages.add(studentImage!);
//            uploadImageCallBack(status:status ,message:message );
//          }
//        });
//  }
//
//  Future<bool> deleteImage (BuildContext context,{required int id}) async{
//    bool deleted=await ImagesApiController().deleteImage(context, id: id);
//    if(deleted){
//      studentImages.removeWhere((element) => element.id==id);
//    }
//    return deleted;
//  }
//}