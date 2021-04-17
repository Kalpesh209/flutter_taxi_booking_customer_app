import 'package:flutter/material.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/pay_widget.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/viit_appbar.dart';


class GPayScreen extends StatelessWidget {
  static const String routeName = "gpay";

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
          titleWidget: ViitTitleWidget("Google Pay"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: <Widget>[
              Text(
                "Google Pay brings together everything you need and keep your payment secure.",
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
                payLogo: "assets/google.png",
                payName: "Google Pay",
                isShowDelIcon: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
