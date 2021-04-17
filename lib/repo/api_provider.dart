import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_taxi_booking_customer_app/common/model/common_response.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_const.dart';
import 'package:flutter_taxi_booking_customer_app/features/loginsignup/login/model/LoginResponse.dart';


abstract class APIProvider {
  Future<Either<DioError, LoginResponse>> login({
    String mobileCountryCode,
    String mobile,
    String deviceId,
    String deviceToken,
    String deviceName,
    String deviceType,
  });

  Future<Either<DioError, CommonResponse>> sendOTP(
    String type,
    String userId,
  );
}

class APIProviderIml extends APIProvider {
  final String _endPoint = kAPIBaseURL;
  final Dio _dio = Dio();

  APIProviderIml() {
    print("APIProviderIml()");
    _dio.options.baseUrl = _endPoint;
    _dio.interceptors.add(LogInterceptor(responseBody: false));
    _dio.options.contentType = "application/x-www-form-urlencoded";
  }

  @override
  Future<Either<DioError, LoginResponse>> login({
    String mobileCountryCode,
    String mobile,
    String deviceId,
    String deviceToken,
    String deviceName,
    String deviceType,
  }) async {
    Response response;
    print("APIProvider: login");
    try {
      response = await _dio.post(
        "/provider/authenticate",
//          data: {"mobile_country_code": mobileCountryCode, "mobile": mobile}
        data: {
          "mobile_country_code": mobileCountryCode,
          "mobile_no": mobile,
          "device_id": deviceId,
          "device_token": deviceToken,
          "device_name": deviceName,
          "device_type": deviceType,
        },
      );

      print("===== Response Start =======");
      print(response.data.toString());
      print("===== Response End =======");
      print(LoginResponse.fromJson(json.decode(response.data)));

      return Right(LoginResponse.fromJson(json.decode(response.data)));
    } on DioError catch (dioError) {
      print("===== Error Catch =======");
      print(this.toString());
      print("===== Error Catch =======");
      return Left(dioError);
    }
  }

  @override
  Future<Either<DioError, CommonResponse>> sendOTP(
    String type,
    String userId,
  ) async {
    Response response;
    print("APIProvider: sendOTP");
    try {
      Map<String, String> requestData = {
        "type": type,
        "user_id": userId,
      };

      response = await _dio.post(
        "/common/send-otp",
        data: requestData,
      );

      print("===== Response Start =======");
      print(response.data.toString());
      print("===== Response End =======");

//      return Right(LoginResponse.fromJson(response.data));
    } on DioError catch (dioError) {
      print("===== Error Catch =======");
      print(this.toString());
      print("===== Error Catch =======");
      return Left(dioError);
    }
  }
}
