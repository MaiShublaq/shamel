


import 'dart:convert';

import 'package:shamel/api/api_helpers.dart';
import 'package:flutter/material.dart';
import 'package:shamel/api/api_settings.dart';
import 'package:http/http.dart' as http;
import 'package:shamel/models/City.dart';
import 'package:shamel/models/Order.dart';
import 'package:shamel/models/children.dart';
import 'package:shamel/models/methaq.dart';
import 'package:shamel/models/notification.dart';
import 'package:shamel/models/vists.dart';


class AppApi with ApiHelpers{

  Future <bool> ContactUs (BuildContext context,{required String title,required String message}) async {
    print('in login first');
    var url = Uri.parse(ApiSettings.contactUs);
    var response = await http.post(url, body: {
      'title': title,
      'message': message,

    },
        headers: headers
    );

    print(response.statusCode);
    print(response.body);
    if(response.statusCode==200){
      print(jsonDecode(response.body)['message']);
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


  Future<List<NotificationData>> getNotification() async {
    var url = Uri.parse(ApiSettings.notification);
    print(headers);

    var response = await http.get(url,headers: headers);

    print(jsonDecode(response.body));
    if (response.statusCode == 200) {
      var notificationJsonArray = jsonDecode(response.body)['data'] as List;
      return notificationJsonArray
          .map((jsonObject) => NotificationData.fromJson(jsonObject))
          .toList();
    }
    return [];
  }


  Future<List<Children>> getChildren() async {
    var url = Uri.parse(ApiSettings.children);
    print(headers);

    var response = await http.get(url,headers: headers);

    print(jsonDecode(response.body));
    if (response.statusCode == 200) {
      var childrenJsonArray = jsonDecode(response.body)['data'] as List;
      return childrenJsonArray
          .map((jsonObject) => Children.fromJson(jsonObject))
          .toList();
    }
    return [];
  }

  Future<List<Order>> getOrder() async {
    var url = Uri.parse(ApiSettings.order);
    print(headers);

    var response = await http.get(url,headers: headers);

    print(jsonDecode(response.body));
    if (response.statusCode == 200) {
      var orderJsonArray = jsonDecode(response.body)['data'] as List;
      return orderJsonArray
          .map((jsonObject) => Order.fromJson(jsonObject))
          .toList();
    }
    return [];
  }

  Future <bool> sendOrder (BuildContext context,{required String request_id,required String note}) async {
    print('in login first');
    print(request_id);
    print(note);
    var url = Uri.parse(ApiSettings.sendorder);
    var response = await http.post(url, body: {
      'request_id': request_id,
      'note': note,

    },
        headers: headers
    );

    print(response.statusCode);
    print(response.body);
    if(response.statusCode==200){
      print(jsonDecode(response.body)['message']);
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

  Future<List<Visit>> getVisits() async {
    var url = Uri.parse(ApiSettings.allVisits);
   // print(headers);

    var response = await http.get(url,headers: headers);

   // print(jsonDecode(response.body));
    if (response.statusCode == 200) {
      var visitsJsonArray = jsonDecode(response.body)['data'] as List;
      return visitsJsonArray
          .map((jsonObject) => Visit.fromJson(jsonObject))
          .toList();
    }
    return [];
  }

  Future<Visit?> getNextVisit() async {
    var url = Uri.parse(ApiSettings.nextVisit);
    // print(headers);

    var response = await http.get(url,headers: headers);

    // print(jsonDecode(response.body));
    if (response.statusCode == 200) {
      var visitsJsonArray = jsonDecode(response.body)['data'];
      return visitsJsonArray
          .map((jsonObject) => Visit.fromJson(jsonObject))
          ;
    }
    return null;
  }





  Future<List<City>> getCities() async {
    var url = Uri.parse(ApiSettings.cities);
    print(headers);

    var response = await http.get(url,headers: headers);

    print(jsonDecode(response.body));
    if (response.statusCode == 200) {
      var cityJsonArray = jsonDecode(response.body)['data'] as List;
      return cityJsonArray
          .map((jsonObject) => City.fromJson(jsonObject))
          .toList();
    }
    return [];
  }




  Future<Methaq> getMethaq() async {
    var url = Uri.parse(ApiSettings.methaq);
    print(headers);

    var response = await http.get(url,headers: headers);

    print(jsonDecode(response.body));
    if (response.statusCode == 200) {
      print(jsonDecode(response.body)['data']);
      var methaq = jsonDecode(response.body)['data'];
      return methaq;
    }
    return Methaq();
  }

}
