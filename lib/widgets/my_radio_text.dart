import 'package:flutter/material.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';


class MyRadioText extends StatefulWidget {
  final String text;
  int myVal;
  int myGroupVal;
  Function(int) myOnChanged;

  MyRadioText({
    Key key,
    this.text,
    this.myVal,
    this.myGroupVal,
    this.myOnChanged,
  }) : super(key: key);

  @override
  _MyRadioTextState createState() => _MyRadioTextState();
}

class _MyRadioTextState extends State<MyRadioText> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          value: widget.myVal,
          activeColor: kPrimaryColor,
          groupValue: widget.myGroupVal,
          onChanged: (val) {
            widget.myOnChanged(val);
          },
        ),
        Text(
          widget.text,
          style: Theme.of(context).textTheme.caption.copyWith(
                color: kPrimaryColor,
                fontSize: 17,
              ),
        )
      ],
    );
  }
}
