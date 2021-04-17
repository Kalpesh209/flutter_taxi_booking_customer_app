import 'package:flutter/material.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/flat_button_widget.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/password_textfield.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/viit_appbar.dart';


class ChangePasswordScreen extends StatelessWidget {
  static const String routeName = "changepassword";

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
          titleWidget: ViitTitleWidget("Change Password"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(21.0),
          child: Column(
            children: <Widget>[
              PasswordFormField(
                hintText: "Enter Old Password",
              ),
              PasswordFormField(
                hintText: "Enter New Password",
              ),
              PasswordFormField(
                hintText: "Enter Confirm Password",
              ),
              FlatButtonWidget(
                btnTxt: "Submit",
                btnColor: kAccentColor,
                btnOnTap: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
