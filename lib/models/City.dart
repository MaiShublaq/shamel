
class City {
  int? id;
  String? name;


  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }


}