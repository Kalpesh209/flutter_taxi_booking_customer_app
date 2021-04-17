import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';


class PrivacyWidget extends StatelessWidget {
  final String myTitle;
  final String mydeisc;

  PrivacyWidget({
    this.myTitle,
    this.mydeisc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                myTitle,
                style: Theme.of(context).textTheme.caption.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Color(0XFF275687),
                    fontSize: 17),
              ),
              SizedBox(
                height: 3,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.8,
                child: Text(
                  mydeisc,
                  style: Theme.of(context).textTheme.caption.copyWith(
                        color: Colors.black26,
                        fontSize: 14,
                      ),
                ),
              )
            ],
          ),
          Transform.scale(
              scale: 0.8,
              child: CupertinoSwitch(
                activeColor: kPrimaryColor,
                value: true,
              )),
        ],
      ),
    );
  }
}
