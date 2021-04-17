import 'package:flutter/material.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';
import 'package:flutter_taxi_booking_customer_app/common/viiticons_icons.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/flat_button_widget.dart';


class DialogBoxWidget extends StatelessWidget {
  final bool isIconShow;
  final bool isCloseIconShow;
  final String titleText;
  final String descriptionText;
  final String primaryBtnTxt;
  final String secondaryBtnTxt;
  final VoidCallback onPrimaryTap;
  final VoidCallback onSecondaryTap;
  final VoidCallback myOnCloseTap;

  DialogBoxWidget({
    Key key,
    this.isIconShow = false,
    this.isCloseIconShow = false,
    @required this.titleText,
    @required this.descriptionText,
    @required this.primaryBtnTxt,
    @required this.secondaryBtnTxt,
    @required this.onPrimaryTap,
    @required this.onSecondaryTap,
    this.myOnCloseTap,
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
            isCloseIconShow
                ? SizedBox(
                    height: 12,
                  )
                : SizedBox(
                    height: 25,
                  ),
            isIconShow
                ? Icon(
                    Viiticons.face,
                    size: 86,
                    color: kTextLoginfaceid,
                  )
                : SizedBox(),
            isCloseIconShow
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                        onTap: myOnCloseTap,
                        child: Container(
                          margin: const EdgeInsets.only(
                            right: 12,
                            top: 4,
                          ),
                          width: 21,
                          height: 21,
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(18),
                            ),
                          ),
                          child: Icon(
                            Icons.close,
                            size: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                : SizedBox(),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                top: 15,
              ),
              child: Text(
                titleText,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.caption.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      color: kBlack,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
              child: Text(
                descriptionText,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.caption.copyWith(
                      fontSize: 15,
                      color: kTextLoginfaceid,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                top: 25,
              ),
              child: FlatButtonWidget(
                btnColor: kAccentColor,
                btnTxt: primaryBtnTxt,
                btnOnTap: onPrimaryTap,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 25,
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
