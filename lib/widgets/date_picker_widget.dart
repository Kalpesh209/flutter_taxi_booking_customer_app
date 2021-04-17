import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';


class DatePickerContainer extends StatelessWidget {
  final date;
  final Function selectDate;
  final icon;

  DatePickerContainer({
    Key key,
    this.date,
    this.selectDate,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: selectDate,
      child: Container(
        height: 48,
        width: 500,
        decoration: BoxDecoration(
          color: Color(0XFFF2F2F4),
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Padding(
            padding: const EdgeInsets.only(
              left: 8,
              right: 15,
              bottom: 2,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Opacity(
                  opacity: 0.64,
                  child: Text(
                    date,
                    style: Theme.of(context).textTheme.caption.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black45,
                    ),
                  ),
                ),
                Icon(
                  icon,
                  color:kPrimaryColor,
                  size: 21,
                )
              ],
            )),
      ),
    );
  }
}
