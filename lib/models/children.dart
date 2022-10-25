class Children {
  int? id;
  String? fullName;
  String? nationalId;
  String? birthDate;
  int? age;


  Children.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    nationalId = json['national_id'];
    birthDate = json['birth_date'];
    age = json['age'];
  }


}