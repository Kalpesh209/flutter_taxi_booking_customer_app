import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';


class PayWidget extends StatelessWidget {
  final String payLogo;
  final String payName;
  final String email;
  final bool isShowDelIcon;

  PayWidget({
    @required this.payLogo,
    @required this.payName,
    @required this.email,
    this.isShowDelIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: <Widget>[
        Image.asset(
          payLogo,
          height: 32,
          width: 32,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                payName,
                style: Theme.of(context).textTheme.caption.copyWith(
                      color: kTextLoginfaceid,
                      fontSize: 18,
                    ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                email,
                style: Theme.of(context).textTheme.caption.copyWith(
                      color: kLoginBlack,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
              )
            ],
          ),
        ),
        Expanded(flex: 1, child: SizedBox()),
        isShowDelIcon
            ? Icon(
                CupertinoIcons.delete_solid,
                color: kDottedBorder,
                size: 28,
              )
            : SizedBox(),
      ],
    ));
  }
}
