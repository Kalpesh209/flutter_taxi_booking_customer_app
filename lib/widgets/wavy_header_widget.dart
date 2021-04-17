import 'package:flutter/material.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/viit_appbar.dart';


class WavyHeader extends StatelessWidget {
  final bool isBack;
  final VoidCallback onBackTap;

  WavyHeader({
    this.isBack = false,
    this.onBackTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              color: kPrimaryColor,
            ),
          ),
          clipper: BottomWaveClipper(),
        ),
        Positioned(
          top: 70,
          left: MediaQuery.of(context).size.width / 2 - 62,
          child: Column(
            children: <Widget>[
              Container(
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(120 / 2),
                    border: Border.all(
                      width: 5,
                      color: kPrimaryColor,
                    ),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Image.asset(
                      "assets/logo_small.png",
                      height: 72,
                      width: 72,
                    ),
                  ))
            ],
          ),
        ),
        isBack
            ? GestureDetector(
                onTap: onBackTap,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: ViitAppBarIconWidget(
                      viitAppBarIconType: ViitAppBarIconTypes.BACK,
                    ),
                  ),
                ),
              )
            : SizedBox(),
      ],
    );
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height);
    var secondControlPoint =
        Offset(size.width - (size.width / 2), size.height - 120);
    var secondEndPoint = Offset(size.width, size.height);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height - 5);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
