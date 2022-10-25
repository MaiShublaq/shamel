


import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shamel/api/api_helpers.dart';
import 'package:http/http.dart' as http;
import 'package:shamel/models/base_api_object_response.dart';
import 'package:shamel/models/user.dart';
import 'package:shamel/prefs/shared_pref_controller.dart';
import 'package:shamel/api/api_settings.dart';


class AuthApiController with ApiHelpers {



  Future <bool> login (BuildContext context,{required String national_id,required String password}) async {
    print('in login first');
    var url = Uri.parse(ApiSettings.login);
    var response = await http.post(url, body: {
      'national_id': national_id,
      'password': password,
      'fcm_token':'asdas'
    },
        headers: headers
    );

    print(response.statusCode);
    if (response.statusCode == 200)  {
      var baseApiResponse= BaseApiObjectResponse<User>.fromJson(jsonDecode(response.body)) ;
      showSnackBar(context: context, message: baseApiResponse.message);
      await SharedPrefController().save(user: baseApiResponse.data);

      return true;

    }
    else if(response.statusCode==400){
      showSnackBar(context: context,
          message: jsonDecode(response.body)['message'],
          error: true);

    }
    else{
      showSnackBar(context: context,
          message: 'Something went wrong ,please try again',
          error: true);
    }
    return false;
  }

  Future <bool> logout() async {
    var url = Uri.parse(ApiSettings.logout);
    var response = await http.post(url,headers: headers);
    if (response.statusCode == 200 || response.statusCode == 401) {
      SharedPrefController().clear();
      return true;
    }
    return false;

  }


  Future<bool> forgetPassword(BuildContext context,{required String mobile }) async{
    var url=Uri.parse(ApiSettings.sendCode);
    var response= await http.post(url,body:{
      'mobile':mobile,
    });
    if(response.statusCode==200){
      print(jsonDecode(response.body)['code_debug']);
      return true;
    }
    else if(response.statusCode==400){
      showSnackBar(context: context,
          message: (jsonDecode(response.body)['message']),
          error: true);
    }
    else{
      showSnackBar(context: context,
          message: (jsonDecode(response.body)['message']),
          error: true);
    }
    return false;
  }





  Future<bool> CheckCode(BuildContext context,{required String code})async{
    print('in auth api');

    var url= Uri.parse(ApiSettings.checkCode);
    var response=await http.post(url,headers: {
      HttpHeaders.acceptHeader:'application/json',
    },
        body:{
          'code':code,
      });

    if(response.statusCode==200){
      showSnackBar(context: context,
          message: jsonDecode(response.body)['title']);
      return true;
    }
    else if (response.statusCode==400){
      print(400);
      showSnackBar(context: context,
          message: jsonDecode(response.body)['title'],
          error:true);
      return false;
    }
    else if (response.statusCode==500){
      showSnackBar(context: context,
          message: 'Something went wrong',
          error:true);
    }
    return false;
  }

  Future<bool> resetPassword(BuildContext context,{required String nationalId, required String password})async{
    print('in auth');

    var url= Uri.parse(ApiSettings.resetNewPass);
    var response=await http.post(url,headers: {
      HttpHeaders.acceptHeader:'application/json',
    },
        body:{
          'national_id': nationalId,
          'password':password,
          'password_confirmation':password});
    print(jsonDecode(response.body));

    if(response.statusCode==200){
      showSnackBar(context: context,
          message: jsonDecode(response.body)['title']);
      return true;
    }
    else if (response.statusCode==400){
      print(400);
      showSnackBar(context: context,
          message: jsonDecode(response.body)['message'],
          error:true);
      return false;
    }
    else if (response.statusCode==500){
      showSnackBar(context: context,
          message: 'Something went wrong',
          error:true);
    }
    return false;
  }



  Future <void> updateProfile (BuildContext context,{required User user , required PickedFile pickedFile}) async{
    print('register');

    var url = Uri.parse(ApiSettings.updateProfile);
    var request = http.MultipartRequest("POST", url);
    request.fields["full_name"] =user.name;
    request.fields["email"] =user.email!;
    request.fields["mobile"] =user.mobile;
    request.fields["dob"] =user.birthDate;
    request.fields["city_id"] =user.city;

    http.MultipartFile imageFile =await http.MultipartFile.fromPath('image',pickedFile.path);
    request.files.add(imageFile);
    request.headers[HttpHeaders.authorizationHeader]=SharedPrefController().token;
    request.headers[HttpHeaders.acceptHeader]='application/json';
    var response = await request.send();
    print(response.statusCode);
    response.stream.transform(utf8.decoder).listen((value) async{
      if (response.statusCode == 201) {
        print('200');
        showSnackBar(context: context,
            message: jsonDecode(value)['message']);


      }
      else if (response.statusCode == 400) {
        print('400');
        showSnackBar(context: context,
            message: jsonDecode(value)['message'],
            error: true);
      }
    }
      );
    }




// Future<bool> saveInformation(BuildContext context,{required User user})async{
//   print('in auth');

//   var url= Uri.parse(ApiSettings.resetNewPass);
//   var response=await http.post(url,headers: {
//     HttpHeaders.acceptHeader:'application/json',
//   },
//       body:{
//         'national_id': nationalId,
//         'password':password,
//         'password_confirmation':password});
//   print(jsonDecode(response.body));

//   if(response.statusCode==200){
//     showSnackBar(context: context,
//         message: jsonDecode(response.body)['title']);
//     return true;
//   }
//   else if (response.statusCode==400){
//     print(400);
//     showSnackBar(context: context,
//         message: jsonDecode(response.body)['message'],
//         error:true);
//     return false;
//   }
//   else if (response.statusCode==500){
//     showSnackBar(context: context,
//         message: 'Something went wrong',
//         error:true);
//   }
//   return false;
// }

        }
