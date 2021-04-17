import 'package:flutter/material.dart';
import 'package:flutter_taxi_booking_customer_app/repo/api_provider.dart';
import 'package:flutter_taxi_booking_customer_app/repo/network_info.dart';


class RepoProvider {
  APIProviderIml apiProvider;
  NetworkInfoImpl networkInfo;

  RepoProvider({
    @required this.apiProvider,
    @required this.networkInfo,
  });
}
