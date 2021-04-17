import 'package:flutter/material.dart';

class FABButton extends StatelessWidget {
  final Color bgColor;
  final Icon icon;
  final VoidCallback onTap;
  final double myHeight;
  final double myWidth;

  FABButton({
    Key key,
    @required this.bgColor,
    @required this.icon,
    @required this.onTap,
    this.myHeight = 50,
    this.myWidth = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*return FloatingActionButton(
      elevation: 0,
      mini: false,
      onPressed: onTap,
      child: icon,
      backgroundColor: bgColor,
    );*/

    return GestureDetector(
      onTap: onTap,
      child: ClipOval(
        child: Container(
          child: icon,
          color: bgColor,
          width: myWidth,
          height: myHeight,
        ),
      ),
    );
  }
}
