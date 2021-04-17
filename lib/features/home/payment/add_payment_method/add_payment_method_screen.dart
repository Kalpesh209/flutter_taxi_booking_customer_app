import 'package:flutter/material.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/payment/add_payment_method/add_apple_pay/add_apple_pay_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/payment/add_payment_method/add_card/add_card_screen.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/payment_method_type_widget.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/viit_appbar.dart';


class AddPaymentMethodScreen extends StatelessWidget {
  static const String routeName = "addpaymentmethod";

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
          titleWidget: ViitTitleWidget("Add Payment Method"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Payment Methods",
                    style: Theme.of(context).textTheme.caption.copyWith(
                          color: kLoginBlack,
                          fontSize: 20,
                        ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  children: <Widget>[
                    PaymentMethodTypeWidget(
                      isIcon: true,
                      myLogo: "assets/credit-cards-payment.png",
                      myTitlel: "Credit Card",
                      myOnTap: () {
                        Navigator.of(context)
                            .pushNamed(AddCardScreen.routeName);
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    PaymentMethodTypeWidget(
                      myLogo: "assets/google.png",
                      myTitlel: "Google Pay",
                      myOnTap: () {
                        Navigator.of(context).pushNamed(
                          AddApplePayScreen.routeName,
                          arguments: PayMethodsModal(
                            toolbarTitle: "Enter your Google Pay ID",
                            titleMsg: "Enter your Google Pay UPI ID",
                            hintText: "abc@example",
                            promoteMsg:
                                "Don’t have the app? Download Google Pay from the Google Play Store.",
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    PaymentMethodTypeWidget(
                      myLogo: "assets/apple.png",
                      myTitlel: "Apple Pay",
                      myOnTap: () {
                        Navigator.of(context).pushNamed(
                          AddApplePayScreen.routeName,
                          arguments: PayMethodsModal(
                            toolbarTitle: "Enter your Apple Pay ID",
                            titleMsg: "Enter your Apple Pay UPI ID",
                            hintText: "abc@example",
                            promoteMsg:
                                "Don’t have the app? Download Apple Pay from the Apple App Store.",
                          ),
                        );
                      },
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
