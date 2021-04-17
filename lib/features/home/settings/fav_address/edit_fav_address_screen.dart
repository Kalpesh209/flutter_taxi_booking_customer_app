import 'package:flutter/material.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/flat_button_widget.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/square_textfield_widget.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/viit_appbar.dart';

class EditFavAddressScreen extends StatelessWidget {
  static const String routeName = "editfavaddress";

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
          titleWidget: ViitTitleWidget("Favourite Address"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(26.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Address Name",
                style: Theme.of(context).textTheme.caption.copyWith(
                      color: kLoginBlack,
                      fontSize: 15,
                    ),
              ),
              SizedBox(
                height: 12,
              ),
              SquareTextFieldWidget(
                hintText: "Rue des Lacs",
                inputType: TextInputType.text,
                inputAction: TextInputAction.next,
              ),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Address",
                style: Theme.of(context).textTheme.caption.copyWith(
                      color: kLoginBlack,
                      fontSize: 15,
                    ),
              ),
              SizedBox(
                height: 12,
              ),
              SquareTextFieldWidget(
                hintText: "50, rue des Lacs, 83400 HYÈRES",
                inputType: TextInputType.text,
                inputAction: TextInputAction.done,
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: FlatButtonWidget(
                        height: 52,
                        btnTxt: "Save",
                        btnColor: kAccentColor,
                        btnOnTap: () {
                          print("");
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
