import 'package:flutter/material.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';


class NavMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final double iconSize;
  final BuildContext context;
  final dynamic myOnTap;
  final NavItemDecorationType navDecorationType;

  final highlightedMargin = const EdgeInsets.all(0);
  final nonHighlightedMargin = const EdgeInsets.only(
    left: 0,
    top: 8,
    right: 32,
  );

  const NavMenuItem({
    Key key,
    @required this.context,
    @required this.icon,
    @required this.title,
    @required this.myOnTap,
    this.iconSize = 24,
    this.navDecorationType = NavItemDecorationType.NONE,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: myOnTap,
      child: Container(
        height: 46,
        decoration: buildDecoration(),
        margin: buildMargin(),
        padding: const EdgeInsets.only(
          left: 32,
        ),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              size: iconSize,
              color: navDecorationType == NavItemDecorationType.HIGHLIGHTED
                  ? Colors.white
                  : kLoginBlack,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Text(
                title,
                style: Theme.of(context).textTheme.title.copyWith(
                      color:
                          navDecorationType == NavItemDecorationType.HIGHLIGHTED
                              ? Colors.white
                              : kLoginBlack,
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                      letterSpacing: 0.5,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildMargin() {
    switch (navDecorationType) {
      case NavItemDecorationType.SELECTED:
      case NavItemDecorationType.NONE:
        return nonHighlightedMargin;
      default:
        return highlightedMargin;
    }
  }

  buildDecoration() {
    switch (navDecorationType) {
      case NavItemDecorationType.SELECTED:
        return BoxDecoration(
          color: kNavItemSelected,
          borderRadius: BorderRadius.horizontal(
            left: Radius.zero,
            right: Radius.circular(32.0),
          ),
        );
      case NavItemDecorationType.HIGHLIGHTED:
        return BoxDecoration(
          color: kPrimaryColor,
        );
      default:
        return null;
    }
  }
}

enum NavItemDecorationType { NONE, SELECTED, HIGHLIGHTED }
