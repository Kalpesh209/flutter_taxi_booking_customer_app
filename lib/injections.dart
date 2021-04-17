import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_taxi_booking_customer_app/repo/api_provider.dart';
import 'package:flutter_taxi_booking_customer_app/repo/network_info.dart';
import 'package:flutter_taxi_booking_customer_app/repo/pref_manager.dart';
import 'package:flutter_taxi_booking_customer_app/repo/repo_provider.dart';
import 'package:get_it/get_it.dart';


Future<void> initDependencies() async {
  print("initDependencies()");

  final getIt = GetIt.instance;

  await PrefManager.getInstance();

  // Repository
  getIt.registerLazySingleton<RepoProvider>(
        () =>
        RepoProvider(
          apiProvider: APIProviderIml(),
          networkInfo: NetworkInfoImpl(
            DataConnectionChecker(),
          ),
        ),
  );
}
