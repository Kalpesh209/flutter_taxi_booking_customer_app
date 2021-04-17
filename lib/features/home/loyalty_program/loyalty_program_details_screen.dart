import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/flat_button_widget.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/viit_appbar.dart';


class LoyaltyProgramDetailsScreen extends StatelessWidget {
  static const String routeName = "loyaltyprogramdetails";

  @override
  Widget build(BuildContext context) {
    return LoyaltyProgramDetails();
  }
}

class LoyaltyProgramDetails extends StatefulWidget {
  @override
  _LoyaltyProgramDetailsState createState() => _LoyaltyProgramDetailsState();
}

class _LoyaltyProgramDetailsState extends State<LoyaltyProgramDetails> {
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
          titleWidget: ViitTitleWidget("Loyalty Program"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: <Widget>[
                Text(
                  kLoremText,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption.copyWith(
                        fontSize: 20,
                        color: kLoginBlack,
                      ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  child: Image.asset(
                    "assets/loyalty_program.png",
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  "$kLoremText. $kLoremText. $kLoremText ",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption.copyWith(
                        color: kTextLoginfaceid,
                        fontSize: 14,
                        letterSpacing: 1.3,
                      ),
                ),
                SizedBox(
                  height: 18,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: FlatButtonWidget(
                        btnOnTap: () {
                          Navigator.of(context).pop();
                        },
                        btnTxt: "Got it",
                        btnColor: kAccentColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
