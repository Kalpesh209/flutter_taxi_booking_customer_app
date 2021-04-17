import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';
import 'package:flutter_taxi_booking_customer_app/features/landing/landing_screen.dart';
import 'package:flutter_taxi_booking_customer_app/repo/pref_manager.dart';

import 'injections.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /*For android status bar color.For iOS please check ios/runner appdelegate file*/
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      statusBarColor: kPrimaryColor, //Android
    ),
  );

  final stopwatch = Stopwatch()..start();

  print("main()");

  //This code will ready our repo object for entire app.
  await di.initDependencies();

  print("dependencies time taken: ${stopwatch.elapsed.inMilliseconds}");

  PrefManager pref = await PrefManager.getInstance();

  runApp(LandingScreen(
    Locale(
      pref.defaultLanCode,
      pref.defaultLan,
    ),
  ));
}
