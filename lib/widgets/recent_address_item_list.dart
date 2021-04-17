import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';


class RecentAddressItemList extends StatelessWidget {
  final String addressTitle;
  final String address;
  final IconData myIcon;
  final Color myIconColor;
  final Color myBackgrounColor;
  bool isLastIndex;
  bool isShowEditIcon;
  VoidCallback myOnEditIconTap;

  RecentAddressItemList({
    Key key,
    @required this.addressTitle,
    this.address = "",
    @required this.myIcon,
    @required this.myIconColor,
    @required this.myBackgrounColor,
    this.isLastIndex = false,
    this.isShowEditIcon = false,
    this.myOnEditIconTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              color: myBackgrounColor,
              borderRadius: BorderRadius.circular(
                40 / 2,
              )),
          child: Center(
            child: Icon(
              myIcon,
              size: 18,
              color: myIconColor,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              addressTitle,
              style: Theme.of(context).textTheme.caption.copyWith(
                    color: kLoginBlack,
                    fontSize: 16,
                  ),
            ),
            SizedBox(
              height: address == "" ? 0 : 5,
            ),
            address == ""
                ? SizedBox()
                : Container(
                    width: 210,
                    child: Text(
                      address,
                      style: Theme.of(context).textTheme.caption.copyWith(
                            color: kTextLoginfaceid,
                            fontSize: 14,
                          ),
                    ),
                  ),
            /*SizedBox(
              height: 15,
            ),
            isLastIndex
                ? SizedBox()
                : Container(
                    height: 0.5,
                    width: MediaQuery.of(context).size.width - 130,
                    color: kGrey,
                  ),*/
          ],
        ),
        Expanded(
          flex: 1,
          child: SizedBox(),
        ),
        isShowEditIcon
            ? GestureDetector(
                onTap: myOnEditIconTap,
                child: Icon(
                  Icons.edit,
                  size: 21,
                  color: kDottedBorder,
                ),
              )
            : SizedBox()
      ],
    );
  }
}
