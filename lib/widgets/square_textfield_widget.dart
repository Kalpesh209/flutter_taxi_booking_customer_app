import 'package:flutter/material.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';


class SquareTextFieldWidget extends StatelessWidget {
  final double myHeight;
  final TextEditingController myController;
  final String hintText;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final EdgeInsetsGeometry myMargin;
  final Function(String) onChanged;
  final Function(String) onSubmited;

  SquareTextFieldWidget({
    Key key,
    this.myHeight = 48,
    this.myController,
    this.myMargin = const EdgeInsets.all(0),
    this.hintText,
    this.inputType = TextInputType.text,
    this.inputAction = TextInputAction.done,
    this.onChanged,
    this.onSubmited,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 8,
        right: 8,
        bottom: 2,
      ),
      margin: myMargin,
      height: myHeight,
      decoration: BoxDecoration(
        color: Color(0XFFF2F2F4),
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Opacity(
        opacity: 0.64,
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
                  color: Colors.black45,
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
    );
  }
}
