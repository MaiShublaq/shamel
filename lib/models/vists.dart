
import 'package:shamel/models/hub.dart';

class Visit {
  int? id;
  String? typeVist;
  String? title;
  String? description;
  String? startDate;
  String? endDate;
  String? time;
  Hub? hub;


  Visit.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    typeVist = json['type_vist'];
    title = json['title'];
    description = json['description'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    time = json['time'];
    hub = json['hub'] != null ? new Hub.fromJson(json['hub']) : null;
  }

}
