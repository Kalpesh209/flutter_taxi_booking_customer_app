import 'package:flutter/material.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';


class CompletedRideScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<CompletedRideScreen> {
  var arryLength = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          /*return arryLength != 0
              ? UpcomingRideItmeLayoutWidget()
              : Text(
                  "You have no completed rides.",
                  style: Theme.of(context).textTheme.caption.copyWith(
                        color: kLoginBlack,
                        fontSize: 17,
                      ),
                );*/
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: Text(
                "You have no completed rides.",
                style: Theme.of(context).textTheme.caption.copyWith(
                      color: kLoginBlack,
                      fontSize: 17,
                    ),
              ),
            ),
          );
        });
  }
}
