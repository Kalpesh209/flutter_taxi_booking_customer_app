import 'package:flutter/material.dart';

class SocialMediaWidget extends StatelessWidget {
  final String assetPath;
  final Color bgColor;

  SocialMediaWidget({
    Key key,
    @required this.assetPath,
    @required this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: 10,
        ),
        Container(
            height: 54,
            width: 64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              color: bgColor,
            ),
            child: Center(
              child: Image.asset(
                assetPath,
                height: 36,
                width: 36,
              ),
            )),
      ],
    );
  }
}
