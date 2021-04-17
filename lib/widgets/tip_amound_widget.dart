import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TipAmountWidget extends StatelessWidget {
  final int selectIndex;
  final Function onTapFirstIndex;
  final Function onTapSecendIndex;
  final Function onTapThirdIndex;
  TipAmountWidget({Key key,this.selectIndex,this.onTapFirstIndex,this.onTapSecendIndex,this.onTapThirdIndex}):  super(key: key);
  @override

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15,right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: onTapFirstIndex,
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: selectIndex==1 ? Color(0XFF275687) :Color(0xFFEAEAEB),
              ),
              child: Center(
                child:

                    Text(
                      "€ 1",
                      style: Theme.of(context).textTheme.caption.copyWith(
                          fontWeight: FontWeight.w600,
                          color: selectIndex == 1 ? Colors.white : Colors.black,
                          fontSize: 28),
                    ),

              ),
            ),
          ),

          GestureDetector(
            onTap: onTapSecendIndex,
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color:selectIndex==2 ? Color(0XFF275687) :Color(0xFFEAEAEB),
              ),
              child: Center(
                child:
                     Text(
                      "€ 2",
                      style: Theme.of(context).textTheme.caption.copyWith(
                          fontWeight: FontWeight.w600,
                          color: selectIndex == 2 ? Colors.white : Colors.black,
                          fontSize: 28),
                    ),

              ),
            ),
          ),
          GestureDetector(
            onTap:onTapThirdIndex,
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: selectIndex==3 ? Color(0XFF275687) :Color(0xFFEAEAEB),
              ),
              child: Center(
                child:

                Text(
                  "€ 5",
                  style: Theme.of(context).textTheme.caption.copyWith(
                      fontWeight: FontWeight.w600,
                      color: selectIndex == 3 ? Colors.white : Colors.black,
                      fontSize: 28),
                ),
               ),
            ),
          ),
        ],
      ),
    );
  }
}
