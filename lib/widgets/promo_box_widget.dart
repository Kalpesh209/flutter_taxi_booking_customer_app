import 'package:flutter/material.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/flat_button_widget.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/square_textfield_widget.dart';


class PromoBoxWidget extends StatelessWidget {
  final String titleText;
  final String primaryBtnTxt;
  final String secondaryBtnTxt;
  final VoidCallback onPrimaryTap;
  final VoidCallback onSecondaryTap;

  PromoBoxWidget({
    Key key,
    @required this.titleText,
    @required this.primaryBtnTxt,
    @required this.secondaryBtnTxt,
    @required this.onPrimaryTap,
    @required this.onSecondaryTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                top: 0,
              ),
              child: Text(
                titleText,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.caption.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: kBlack,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                top: 21,
              ),
              child: SquareTextFieldWidget(
                hintText: "Enter Promo Code",
                inputType: TextInputType.text,
                inputAction: TextInputAction.done,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                top: 12,
              ),
              child: FlatButtonWidget(
                btnColor: kAccentColor,
                btnTxt: primaryBtnTxt,
                btnOnTap: onPrimaryTap,
                height: 44,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 18,
                bottom: 15,
                left: 15,
                right: 15,
              ),
              child: GestureDetector(
                onTap: onSecondaryTap,
                child: Center(
                  child: Text(
                    secondaryBtnTxt,
                    style: Theme.of(context).textTheme.caption.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: kAccentColor,
                        ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
