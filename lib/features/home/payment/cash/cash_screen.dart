import 'package:flutter/material.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/viit_appbar.dart';

class CashScreen extends StatelessWidget {
  static const String routeName = "cash";

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
          titleWidget: ViitTitleWidget("Cash"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(21.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Pay for rides with cash",
                style: Theme.of(context).textTheme.caption.copyWith(
                      color: kLoginBlack,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "Your driver’s phone will show you the amount to pay at the end of the ride.",
                style: Theme.of(context).textTheme.caption.copyWith(
                      color: kTextLoginfaceid,
                      fontSize: 16,
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
