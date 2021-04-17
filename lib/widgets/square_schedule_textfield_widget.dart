import 'package:flutter/material.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/flat_button_widget.dart';

class SquareScheduleTextFieldWidget extends StatelessWidget {
  final double myHeight;

//  final TextEditingController myController;
  final String hintText;

//  final TextInputType inputType;
//  final TextInputAction inputAction;
  final EdgeInsetsGeometry myMargin;

//  final Function(String) onChanged;
//  final Function(String) onSubmited;
  final VoidCallback onScheduleTap;
  final VoidCallback onWhereToTap;

  SquareScheduleTextFieldWidget({
    Key key,
    this.myHeight = 51,
//    this.myController,
    this.myMargin = const EdgeInsets.all(0),
    this.hintText,
//    this.inputType = TextInputType.text,
//    this.inputAction = TextInputAction.done,
//    this.onChanged,
//    this.onSubmited,
    this.onScheduleTap,
    this.onWhereToTap,
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
              color: kShareCodeBg,
              borderRadius: BorderRadius.circular(10.0),
              /*border: Border.all(
                color: Color(0XFFE6E1E1),
                width: 1,
              ),*/
            ),
            child: Row(
              children: <Widget>[
                Opacity(
                  opacity: 0.64,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: GestureDetector(
                      onTap: onWhereToTap,
                      child: Text(
                        hintText,
                        style: Theme.of(context).textTheme.caption.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: kLoginBlack,
                            ),
                      ),
                    ) /*TextField(
                      style: Theme.of(context).textTheme.caption.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: kLoginBlack,
                          ),
                      enabled: false,
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
                    )*/
                    ,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 0, right: 8),
              child: FlatButtonWidget(
                btnTxt: "Schedule",
                height: 38,
                btnOnTap: onScheduleTap,
                btnColor: kAccentColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
