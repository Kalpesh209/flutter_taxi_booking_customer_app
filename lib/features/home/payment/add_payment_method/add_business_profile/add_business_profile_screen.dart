import 'package:flutter/material.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';
import 'package:flutter_taxi_booking_customer_app/common/viiticons_icons.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/payment/add_payment_method/add_business_profile/whats_your_business_email_screen.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/flat_button_widget.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/viit_appbar.dart';

class AddBusinessProfileScreen extends StatelessWidget {
  static const String routeName = "addbusinessprofile";

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
          titleWidget: ViitTitleWidget("Add Business Profile"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(26.0),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Color(0XFFEDEBEB),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Viiticons.work,
                            color: kLoginBlack,
                            size: 28,
                          ),
                          SizedBox(
                            width: 18,
                          ),
                          Container(
                              child: Text(
                            "Ride for business",
                            style: Theme.of(context).textTheme.caption.copyWith(
                                  color: kLoginBlack,
                                  fontSize: 20,
                                ),
                          ))
                        ],
                      ),
                      SizedBox(
                        height: 26,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.check,
                            color: kPrimaryColor,
                            size: 18,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            "Keep work rides separate ",
                            style: Theme.of(context).textTheme.caption.copyWith(
                                  color: kPrimaryColor,
                                  fontSize: 16,
                                ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.check,
                            color: kPrimaryColor,
                            size: 18,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            "Get travel reports",
                            style: Theme.of(context)
                                .textTheme
                                .caption
                                .copyWith(color: kPrimaryColor, fontSize: 16),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.check,
                            color: kPrimaryColor,
                            size: 18,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            "Make expensing seamless & easy",
                            style: Theme.of(context).textTheme.caption.copyWith(
                                  color: kPrimaryColor,
                                  fontSize: 16,
                                ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: FlatButtonWidget(
                          btnTxt: "Join Now",
                          btnColor: kAccentColor,
                          btnOnTap: () {
                            Navigator.of(context).pushNamed(
                              WhatsYourBusinessEmailScreen.routeName,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
