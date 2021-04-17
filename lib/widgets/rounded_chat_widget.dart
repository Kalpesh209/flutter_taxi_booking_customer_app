import 'package:flutter/material.dart';

class RoundedChatWidget extends StatelessWidget {
  final Color backgroundColor;
  final String chatImg;
  final double containerHeight;
  final double containerWidth;

  RoundedChatWidget({
    Key key,
    @required this.backgroundColor,
    @required this.chatImg,
    @required this.containerHeight,
    @required this.containerWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: containerHeight,
          width: containerWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(containerHeight / 2),
            color: backgroundColor,
          ),
          child: Center(
            child: Image.asset(
              chatImg,
              height: 20,
              width: 20,
            ),
          ),
        )
      ],
    );
  }
}
