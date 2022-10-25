class Methaq {
  String? title;
  String? body;

  Methaq();

  Methaq.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    body = json['body'];
  }


}