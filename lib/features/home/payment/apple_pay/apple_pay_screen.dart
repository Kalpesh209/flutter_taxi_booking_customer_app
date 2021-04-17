import 'package:flutter/material.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/pay_widget.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/viit_appbar.dart';


class ApplePayScreen extends StatelessWidget {
  static const String routeName = "applepay";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: ViitAppBar(
          onLeadingPressed: () {
            Navigator.of(context).pop();
          },
          leadingWidget: ViitAppBarIconWidget(
            viitAppBarIconType: ViitAppBarIconTypes.BACK,
          ),
          titleWidget: ViitTitleWidget("Apple Pay"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: <Widget>[
              Text(
                "Accepting Apple pay is faster than accepting traditional apple device & move consumer away from physical wallet.",
                style: Theme.of(context).textTheme.caption.copyWith(
                      color: kTextLoginfaceid,
                      fontSize: 16,
                    ),
              ),
              SizedBox(
                height: 26,
              ),
              PayWidget(
                email: "mellissa.brunt69@gmail.com",
                payLogo: "assets/apple.png",
                payName: "Apple Pay",
                isShowDelIcon: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
