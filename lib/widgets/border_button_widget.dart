import 'package:flutter/material.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';


class BorderButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback myOnTap;

  const BorderButtonWidget({
    Key key,
    @required this.text,
    @required this.myOnTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: myOnTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: kPrimaryColor),
          borderRadius: BorderRadius.all(
            Radius.circular(24),
          ),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 21,
        ),
        child: Opacity(
          opacity: 0.8,
          child: Text(
            text,
            style: Theme.of(context).textTheme.caption.copyWith(
              fontSize: 16,
              color: kPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
