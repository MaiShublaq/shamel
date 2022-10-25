class NotificationData {
  String? title;
  String? description;


  NotificationData.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
  }

}