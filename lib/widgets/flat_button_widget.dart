import 'package:flutter/material.dart';

class FlatButtonWidget extends StatelessWidget {
  final Color btnColor;
  final String btnTxt;
  final Function btnOnTap;
  double height;

  FlatButtonWidget({
    Key key,
    this.btnColor,
    @required this.btnTxt,
    this.btnOnTap,
    this.height = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28.0),
        ),
        color: btnColor,
        onPressed: btnOnTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 12,
          ),
          child: Text(
            btnTxt,
            style: Theme.of(context).textTheme.caption.copyWith(
                  fontSize: 18,
                  color: Colors.white,
                ),
          ),
        ),
      ),
    );
  }
}
