import 'package:flutter/material.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';
import 'package:flutter_taxi_booking_customer_app/common/viiticons_icons.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/flat_button_widget.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/pay_widget.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/viit_appbar.dart';


class ChoosePaymentMethodScreen extends StatefulWidget {
  static const String routeName = "choosepaymentmethod";
  final ChoosePaymentMethodScreenArguments arguments;

  ChoosePaymentMethodScreen({this.arguments});

  @override
  _ChoosePaymentMethodScreenState createState() =>
      _ChoosePaymentMethodScreenState();
}

class _ChoosePaymentMethodScreenState extends State<ChoosePaymentMethodScreen> {
  var isSelected;
  var selectIndex;

  @override
  Widget build(BuildContext context) {
    var listText = List<String>();

    listText.add("Cash");
    listText.add("Credit/Debit Card");
    listText.add("Google Pay");
    listText.add("Apple Pay");

    return SafeArea(
      child: Scaffold(
        appBar: ViitAppBar(
          onLeadingPressed: () {
            Navigator.of(context).pop();
          },
          leadingWidget: ViitAppBarIconWidget(
            viitAppBarIconType: ViitAppBarIconTypes.BACK,
          ),
          titleWidget: ViitTitleWidget("Choose Payment Method"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(21),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "How would you like to pay when you ride for ${widget.arguments.paymentMethodScreenFor}? ",
                  style: Theme.of(context).textTheme.caption.copyWith(
                        fontWeight: FontWeight.w500,
                        color: kLoginBlack,
                        fontSize: 19,
                      ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Payment Method",
                  style: Theme.of(context).textTheme.caption.copyWith(
                        color: kTextLoginfaceid,
                        fontSize: 15,
                      ),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Viiticons.cash,
                          size: 24,
                          color: kDottedBorder,
                        ),
                        SizedBox(
                          width: 18,
                        ),
                        Text(
                          "Cash",
                          style: Theme.of(context).textTheme.caption.copyWith(
                                color: kDottedBorder,
                                fontSize: 18,
                              ),
                        )
                      ],
                    ),
                    Transform.scale(
                      scale: 1.3,
                      child: Radio(
                        activeColor: kPrimaryColor,
                        value: 1,
                        groupValue: isSelected,
                        onChanged: (val) {
                          setState(() {
                            isSelected = val;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 0.5,
                  width: MediaQuery.of(context).size.width,
                  color: kSettingDivider,
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Credit Card",
                          style: Theme.of(context).textTheme.caption.copyWith(
                                color: kLoginBlack,
                                fontSize: 16,
                              ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Icon(
                          Viiticons.visa_card,
                          size: 24,
                          color: kDottedBorder,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "**** **** **** 5967",
                              style:
                                  Theme.of(context).textTheme.caption.copyWith(
                                        color: Color(0XFF8F92A1),
                                        fontSize: 14,
                                        letterSpacing: 1.1,
                                      ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Transform.scale(
                      scale: 1.3,
                      child: Radio(
                        activeColor: kPrimaryColor,
                        value: 2,
                        groupValue: isSelected,
                        onChanged: (val) {
                          setState(() {
                            isSelected = val;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 0.5,
                  width: MediaQuery.of(context).size.width,
                  color: kSettingDivider,
                ),
                SizedBox(
                  height: 20,
                ),
                Stack(
                  children: <Widget>[
                    PayWidget(
                      payLogo: "assets/google.png",
                      payName: "Google Pay",
                      email: "melissa.brunt69@gmail.com",
                    ),
                    Positioned(
                      right: 0,
                      child: Transform.scale(
                        scale: 1.3,
                        child: Radio(
                          activeColor: kPrimaryColor,
                          value: 3,
                          groupValue: isSelected,
                          onChanged: (val) {
                            setState(() {
                              isSelected = val;
                            });
                          },
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 0.5,
                  width: MediaQuery.of(context).size.width,
                  color: kSettingDivider,
                ),
                SizedBox(
                  height: 20,
                ),
                Stack(
                  children: <Widget>[
                    PayWidget(
                      payLogo: "assets/apple.png",
                      payName: "Apple Pay",
                      email: "melissa.brunt69@gmail.com",
                    ),
                    Positioned(
                      right: 0,
                      child: Transform.scale(
                        scale: 1.3,
                        child: Radio(
                          activeColor: kPrimaryColor,
                          value: 4,
                          groupValue: isSelected,
                          onChanged: (val) {
                            setState(() {
                              isSelected = val;
                            });
                          },
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 0.5,
                  width: MediaQuery.of(context).size.width,
                  color: kSettingDivider,
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  child: Text(
                    "Add Payment Method",
                    style: Theme.of(context).textTheme.caption.copyWith(
                          color: kPrimaryColor,
                          fontSize: 16,
                        ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "You can always switch to a different payment method",
                  style: Theme.of(context).textTheme.caption.copyWith(
                        color: kDottedBorder,
                        fontSize: 15,
                      ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: FlatButtonWidget(
                        btnOnTap: () {
                          Navigator.of(context)
                              .popUntil((route) => route.isFirst);
                        },
                        btnTxt: "Done",
                        btnColor: kAccentColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChoosePaymentMethodScreenArguments {
  final String paymentMethodScreenFor;

  ChoosePaymentMethodScreenArguments({this.paymentMethodScreenFor});
}
