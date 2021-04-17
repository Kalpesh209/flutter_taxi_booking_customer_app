

import 'package:flutter_taxi_booking_customer_app/common/model/common_response.dart';

class LoginResponse extends CommonResponse {
  Payload payload;

  /*Error error;
  String status;*/

  LoginResponse({error, this.payload, status});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'] != null ? Error.fromJson(json['error']) : null;
    payload =
        json['payload'] != null ? new Payload.fromJson(json['payload']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.error != null) {
      data['error'] = this.error.toJson();
    }
    if (this.payload != null) {
      data['payload'] = this.payload.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Payload {
  String passengerId;
  String name;
  String email;
  String mobile;
  String profilePicture;
  int credits;
  String accessToken;

  Payload(
      {this.passengerId,
      this.name,
      this.email,
      this.mobile,
      this.profilePicture,
      this.credits,
      this.accessToken});

  Payload.fromJson(Map<String, dynamic> json) {
    passengerId = json['passenger_id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    profilePicture = json['profile_picture'];
    credits = json['credits'];
    accessToken = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['passenger_id'] = this.passengerId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['profile_picture'] = this.profilePicture;
    data['credits'] = this.credits;
    data['access_token'] = this.accessToken;
    return data;
  }
}

/*class Error {
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
}*/
