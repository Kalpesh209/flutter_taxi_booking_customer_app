import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';


class VehicleItemLayoutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Image.asset(
                  "assets/automobile.png",
                  height: 60,
                  width: 60,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Vitt S",
                      style: Theme.of(context).textTheme.caption.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 17),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      "1 - 3 Seats",
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .copyWith(color: Colors.black38, fontSize: 14),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      "8.5 km / ETA 20 min",
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .copyWith(color: Colors.black38, fontSize: 14),
                    ),
                  ],
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                "€ 25.39",
                style: Theme.of(context).textTheme.caption.copyWith(
                    fontSize: 22,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w800),
              ),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.info,
                color: kAccentColor,
                size: 25,
              )
            ],
          )
        ],
      ),
    );
  }
}
