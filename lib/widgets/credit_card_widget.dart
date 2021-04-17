import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';
import 'package:flutter_taxi_booking_customer_app/common/viiticons_icons.dart';


class CreditCardWidget extends StatelessWidget {
  final String cardType;
  final String cardNumber;
  final String cardExpireDate;
  final VoidCallback myOnDeleteTap;

  CreditCardWidget({
    Key key,
    @required this.cardType,
    @required this.cardNumber,
    @required this.cardExpireDate,
    @required this.myOnDeleteTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kSettingFavAddAvtarBg,
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      cardType,
                      style: Theme.of(context).textTheme.caption.copyWith(
                            color: kLoginBlack,
                            fontSize: 16,
                          ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Icon(
                      Viiticons.visa_card,
                      size: 24,
                      color: kTextLoginfaceid,
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          cardNumber,
                          style: Theme.of(context).textTheme.caption.copyWith(
                                fontSize: 14,
                                color: kTextLoginfaceid,
                                letterSpacing: 1.1,
                              ),
                        ),
                      ],
                    )
                  ],
                ),
                GestureDetector(
                  onTap: myOnDeleteTap,
                  child: Icon(
                    CupertinoIcons.delete,
                    color: kTextLoginfaceid,
                    size: 30,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Expiry date",
              style: Theme.of(context).textTheme.caption.copyWith(
                    fontWeight: FontWeight.w500,
                    color: kLoginBlack,
                    fontSize: 16,
                  ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              cardExpireDate,
              style: Theme.of(context).textTheme.caption.copyWith(
                    color: kTextLoginfaceid,
                    fontSize: 14,
                  ),
            ),
            SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
