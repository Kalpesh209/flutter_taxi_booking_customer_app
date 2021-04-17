import 'package:flutter/material.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/upcoming_ride_itmelayout_widget.dart';


class CanceledRideScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<CanceledRideScreen> {
  var arryLength = 1;
  List<String> rideTimes = [
    "Dec 2, 2019 8:25 AM",
  ];
  List<String> rideType = [
    "Vitt S",
  ];
  List<String> pickUpAdd = [
    "38, rue des Nations",
  ];
  List<String> dropUpAdd = [
    "54, rue du Gue Jacquet",
  ];
  List<String> amount = ["€ 43.10", "€ 33.60", "€ 12.14"];
  List<String> image = [
    "assets/mapiamge.jpeg",
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: rideTimes.length,
      itemBuilder: (BuildContext context, int index) {
        return UpcomingRideItmeLayoutWidget(
          rideTime: rideTimes[index],
          rideName: rideType[index],
          droopupAddress: dropUpAdd[index],
          pickupAddress: pickUpAdd[index],
          rideAmount: amount[index],
          rideImage: image[index],
        );
      },
    );
  }
}
