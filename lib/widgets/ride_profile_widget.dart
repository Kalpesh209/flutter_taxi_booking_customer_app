import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';


class RideProfileWidget extends StatelessWidget {
  final Icon myLogo;
  final String myTitlel;
  final Color myColor;
  final VoidCallback myOnTap;

  RideProfileWidget({
    @required this.myLogo,
    @required this.myTitlel,
    @required this.myColor,
    @required this.myOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: myOnTap,
      child: Card(
        elevation: 0,
        color: kSocialBg,
        child: Padding(
          padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
          child: Row(
            children: <Widget>[
              Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50 / 2),
                  color: myColor,
                ),
                child: Center(
                  child: myLogo,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    myTitlel,
                    style: Theme.of(context).textTheme.caption.copyWith(
                          color: kLoginBlack,
                          fontSize: 18,
                          letterSpacing: 0.7,
                        ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
