import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';


class LanguageButton extends StatelessWidget {
  final Color btnColor;
  final Color btnBorderColor;
  final String btnTxt;
  final VoidCallback btnOnTap;
  final bool isShowIcon;

  LanguageButton({
    Key key,
    this.btnColor = kPrimaryColor,
    this.btnBorderColor = Colors.white,
    @required this.btnTxt,
    this.btnOnTap,
    this.isShowIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: 220,
          height: 49,
          child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.0),
              side: BorderSide(color: Colors.white),
            ),
            color: btnColor,
            onPressed: btnOnTap,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 32,
                right: 32,
              ),
              child: Text(
                btnTxt,
                style: Theme.of(context).textTheme.caption.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white,
                    ),
              ),
            ),
          ),
        ),
        isShowIcon
            ? Positioned(
                right: 10,
                top: 12,
                child: Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25 / 2),
                      color: Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.chevron_right,
                        color: Color(0XFF275687),
                      )
                    ],
                  ),
                ),
              )
            : SizedBox(),
      ],
    );
  }
}
