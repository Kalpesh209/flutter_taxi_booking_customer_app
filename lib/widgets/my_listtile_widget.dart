import 'package:flutter/material.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';


class MyListTitle extends StatelessWidget {
  final String title;
  final VoidCallback myOnTap;
  final bool isLastIndex;

  MyListTitle({
    @required this.title,
    @required this.myOnTap,
    this.isLastIndex = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: myOnTap,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 260,
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.caption.copyWith(
                          color: kLoginBlack,
                          fontSize: 18,
                        ),
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  size: 30,
                  color: kLoginBlack,
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            isLastIndex
                ? SizedBox()
                : Divider(
                    color: kGrey,
                    height: 0.5,
                  ),
          ],
        ),
      ),
    );
  }
}
