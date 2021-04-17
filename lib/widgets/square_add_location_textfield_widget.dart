import 'package:flutter/material.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';
import 'package:flutter_taxi_booking_customer_app/common/viiticons_icons.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/fab_button.dart';


class SquareAddLocationTextFieldWidget extends StatelessWidget {
  final double myHeight;
  final TextEditingController myController;
  final String hintText;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final EdgeInsetsGeometry myMargin;
  final Function(String) onChanged;
  final Function(String) onSubmited;
  final VoidCallback onFabTap;

  SquareAddLocationTextFieldWidget({
    Key key,
    this.myHeight = 60,
    this.myController,
    this.myMargin = const EdgeInsets.all(0),
    this.hintText,
    this.inputType = TextInputType.text,
    this.inputAction = TextInputAction.done,
    this.onChanged,
    this.onSubmited,
    this.onFabTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: myHeight,
      child: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(
              left: 8,
              right: 8,
            ),
            margin: myMargin,
            height: myHeight,
            decoration: BoxDecoration(
              color: Color(0XFFF6F7FB),
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Color(0XFFE6E1E1),width: 1,),
            ),
            child: Opacity(
              opacity: 0.64,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 2,),
                  child: TextField(
                    style: Theme.of(context).textTheme.caption.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: kLoginBlack,
                        ),
                    controller: myController,
                    keyboardType: inputType,
                    textInputAction: inputAction,
                    decoration: InputDecoration(
                      focusColor: Colors.green,
                      border: InputBorder.none,
                      hintText: hintText,
                      hintStyle: Theme.of(context).textTheme.caption.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: kLoginBlack,
                          ),
                      fillColor: Colors.red,
                    ),
                    onChanged: (str) {
                      onChanged(str);
                    },
                    onSubmitted: (str) {
                      onSubmited(str);
                    },
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 6,right: 8),
              child: FABButton(
                myHeight: 45,
                myWidth: 45,
                bgColor: kAccentColor,
                icon: Icon(
                  Viiticons.plus,
                  color: Colors.white,
                ),
                onTap: onFabTap
                  /*Navigator.of(context).pushNamed(
                    LocationFromMapScreen.routeName,
                    arguments: LocationFromMapScreenArguments(
                      toolbarTitle: "Add Work Address",
                      hintText: "Enter work address",
                    ),
                  );
                },*/
              ),
            ),
          )
        ],
      ),
    );
  }
}
