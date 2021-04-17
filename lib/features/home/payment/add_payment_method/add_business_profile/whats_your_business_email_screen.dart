import 'package:flutter/material.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/payment/add_payment_method/add_business_profile/choose_payment_method_for_default.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/flat_button_widget.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/square_textfield_widget.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/viit_appbar.dart';


class WhatsYourBusinessEmailScreen extends StatelessWidget {
  static const String routeName = "whatsyourbusinessemail";

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
          titleWidget: ViitTitleWidget("Business"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(26.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "What’s your business email?",
                style: Theme.of(context).textTheme.caption.copyWith(
                      color: kLoginBlack,
                      fontSize: 15,
                    ),
              ),
              SizedBox(
                height: 12,
              ),
              SquareTextFieldWidget(
                inputAction: TextInputAction.done,
                inputType: TextInputType.emailAddress,
                hintText: "Enter business email",
              ),
              SizedBox(
                height: 18,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      child: FlatButtonWidget(
                        btnTxt: "Next",
                        btnColor: kAccentColor,
                        btnOnTap: () {
                          Navigator.of(context).pushNamed(
                            ChoosePaymentMethodScreen.routeName,
                            arguments: ChoosePaymentMethodScreenArguments(
                                paymentMethodScreenFor: "business"),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
