
class Order {
  int? id;
  String? title;


  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }


}