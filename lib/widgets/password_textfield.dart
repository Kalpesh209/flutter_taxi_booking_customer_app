import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';


class PasswordFormField extends StatefulWidget {
  final TextEditingController myController;
  FocusNode myFocusNode;
  final String hintText;
  final TextInputAction inputAction;
  final EdgeInsetsGeometry myMargin;
  final Function(String) onChanged;
  final Function(String) onSubmited;

  PasswordFormField({
    Key key,
    this.myController,
    this.myFocusNode,
    this.myMargin = const EdgeInsets.all(0),
    this.hintText,
    this.inputAction = TextInputAction.done,
    this.onChanged,
    this.onSubmited,
  });

  @override
  _PasswordFormFieldState createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool _showPassword = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 8,
        right: 8,
        bottom: 2,
      ),
      margin: widget.myMargin,
      height: 48,
      decoration: BoxDecoration(
        color: kShareCodeBg,
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
          controller: widget.myController,
          focusNode: widget.myFocusNode != null ? widget.myFocusNode : null,
          obscureText: _showPassword,
          keyboardType: TextInputType.text,
          textInputAction: widget.inputAction,
          decoration: InputDecoration(
            focusColor: Colors.green,
            border: InputBorder.none,
            hintText: widget.hintText,
            hintStyle: Theme.of(context).textTheme.caption.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.black45,
                ),
            fillColor: Colors.red,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _showPassword = !_showPassword;
                });
              },
              child: Icon(
                _showPassword ? CupertinoIcons.eye : CupertinoIcons.eye_solid,
                size: 30,
              ),
            ),
          ),
          onChanged: (str) {
            widget.onChanged(str);
          },
          onSubmitted: (str) {
            widget.onSubmited(str);
          },
        ),
      ),
    );
  }
}