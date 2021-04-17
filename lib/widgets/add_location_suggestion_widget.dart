import 'package:flutter/material.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';


class AddLocationSuggestionWidget extends StatelessWidget {
  final IconData iconData;
  final String text;
  final VoidCallback myOnTap;

  AddLocationSuggestionWidget({
    Key key,
    this.iconData,
    this.text,
    this.myOnTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: myOnTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(8),
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              border: Border.all(
                color: kPrimaryColor,
                width: 2,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(56 / 2),
              ),
            ),
            child: Icon(
              iconData,
              color: kPrimaryColor,
              size: 26,
            ),
          ),
          Text(
            text,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
