import 'package:flutter/material.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';


class NotificationWidget extends StatelessWidget {
  final String headerTxt;
  final String descriptionTxt;
  bool isLastIndex;

  NotificationWidget({
    Key key,
    @required this.headerTxt,
    @required this.descriptionTxt,
    @required this.isLastIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Text(
            headerTxt,
            style: Theme.of(context).textTheme.caption.copyWith(
                  color: kLoginBlack,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            descriptionTxt,
            style: Theme.of(context).textTheme.caption.copyWith(
                  color: kTextLoginfaceid,
                  fontSize: 17,
                ),
          ),
          SizedBox(
            height: 4,
          ),
          isLastIndex
              ? SizedBox()
              : Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width,
                  color: kSettingDivider,
                ),
        ],
      ),
    );
  }
}
