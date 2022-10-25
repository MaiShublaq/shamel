class User {
late String name;
late String? email;
late String image;
late String nationalId;
late String city;
late String mobile;
late String birthDate;
late String nationality;
late String genderType;
late String token;

  User();

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email']??'';
    image = json['image'];
    nationalId = json['national_id'];
    city = json['city'];
    mobile = json['mobile'];
    birthDate = json['birth_date'];
    nationality = json['nationality'];
    genderType = json['gender_type'];
    token = json['token'];
  }


}
