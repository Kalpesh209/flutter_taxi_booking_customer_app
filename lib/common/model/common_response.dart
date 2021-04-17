class CommonResponse {
  Error error;
  String status;
}

class Error {
  String name;
  String message;
  int code;

  Error({this.name, this.message, this.code});

  Error.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    message = json['message'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['message'] = this.message;
    data['code'] = this.code;
    return data;
  }
}
