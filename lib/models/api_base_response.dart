import 'package:shamel/models/user.dart';

class ApiBaseResponse {
  late bool status;
  late String message;
 // User? data;


  ApiBaseResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  //  data = json['data'] != null ? new User.fromJson(json['data']) : null;
  }


}
