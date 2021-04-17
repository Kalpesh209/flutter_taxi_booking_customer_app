import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/myrides/canceled_ride_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/myrides/complet_ride_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/myrides/upcoming_ride_screen.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/my_ride_tab_widget.dart';


import 'bloc/bloc.dart';

class MyRidesScreen extends StatelessWidget {
  static const String routeName = "myrides";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: MyRides(),
      create: (context) => MyridesBloc(),
    );
  }
}

class MyRides extends StatefulWidget {
  @override
  _MyRidesState createState() => _MyRidesState();
}

class _MyRidesState extends State<MyRides> {
  var upcomingRideSelect = true;
  var completRideSelect = false;
  var canceledRideSelect = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(
          width: 16,
          height: 16,
        ),
        MyRideTabWidget(
          onTapUpcoming: () {
            setState(() {
              upcomingRideSelect = true;
              completRideSelect = false;
              canceledRideSelect = false;
            });
          },
          onTapComplet: () {
            setState(() {
              upcomingRideSelect = false;
              completRideSelect = true;
              canceledRideSelect = false;
            });
          },
          onTapCancele: () {
            setState(() {
              upcomingRideSelect = false;
              completRideSelect = false;
              canceledRideSelect = true;
            });
          },
          upcomingRideSelect: upcomingRideSelect,
          completRideSelect: completRideSelect,
          canceledRideSelect: canceledRideSelect,
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21),
          child: SingleChildScrollView(
            child: upcomingRideSelect
                ? UpComingRideScreen()
                : completRideSelect
                    ? CompletedRideScreen()
                    : CanceledRideScreen(),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
