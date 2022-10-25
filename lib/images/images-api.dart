
//import 'dart:convert';
//import 'dart:io';
//
//import 'package:flutter/cupertino.dart';
//import 'package:http/http.dart' as http;
//
//typedef UploadImageCallBack =void Function({
//required String message,
//required bool status,
//StudentImage? studentImage,
//});
//class ImagesApiController with Helpers{
//
//  Future<void> uploadImage( BuildContext context,
//      {required String path,
//        required UploadImageCallBack uploadImageCallBack }) async{
//
//    var url =Uri.parse(ApiSettings.images.replaceFirst('/{id}', ''));
//    var request =http.MultipartRequest('POST',url);
//    http.MultipartFile imageFile =await http.MultipartFile.fromPath('image',path);
//    request.files.add(imageFile);
//    request.headers[HttpHeaders.authorizationHeader]=SharedPrefController().token;
//    request.headers[HttpHeaders.acceptHeader]='application/json';
//    var response = await request.send();
//    response.stream.transform(utf8.decoder).listen((value) {
//      if(response.statusCode==201){
//        var jsonResponse = jsonDecode(value);
//        StudentImage studentImage= StudentImage.fromJson((jsonResponse)['data']);
//        uploadImageCallBack(
//            status: true,
//            message: jsonResponse['message'],
//            studentImage: studentImage);
//      }
//
//      else if(response.statusCode==400){
//        uploadImageCallBack(message:jsonDecode(value)['message'] ,status: false);
//      }
//      else if (response.statusCode==500){
//        uploadImageCallBack(status: false,message:'Something went wrong , please try again');
//      }
//
//    });
//
//  }
//
//  Future<List<StudentImage>> images(BuildContext context) async{
//    var url= Uri.parse(ApiSettings.images.replaceFirst('/{id}', ''));
//    var response = await http.get(url,
//        headers: {
//          HttpHeaders.acceptHeader:'application/json',
//          HttpHeaders.authorizationHeader: SharedPrefController().token
//        }
//    );
//    if(response.statusCode==200){
//      var  imageJsonArray = jsonDecode(response.body)['data'] as List;
//      return imageJsonArray.map((e) => StudentImage.fromJson(e)).toList();
//
//    }
//    else{
//      showSnackBar(context: context, message: 'Something went wrong',error: true);
//    }
//    return [];
//  }
//
//
//
//  Future<bool> deleteImage(BuildContext context ,{required int id}) async{
//    var url=Uri.parse(ApiSettings.images.replaceFirst('{id}', id.toString()));
//    var response= await http.post(url,headers: {
//      HttpHeaders.acceptHeader:'application/json',
//      HttpHeaders.authorizationHeader:SharedPrefController().token,
//    });
//    if(response.statusCode==200){
//      showSnackBar(context: context, message: jsonDecode(response.body)['message']);
//      return true;
//    }
//    else if(response.statusCode==400){
//      showSnackBar(context: context, message: jsonDecode(response.body)['message'],error: true);
//    }
//    return false;
//  }
//
//}