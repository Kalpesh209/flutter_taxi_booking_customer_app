import 'package:flutter/material.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';


class ViitAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget leadingWidget;
  final Widget titleWidget;
  final Function onLeadingPressed;
  final bool isActionWidget;
  final Widget actionWidget;
  final Function onActionPressed;
  final bool isTransparent;

  @override
  final Size preferredSize;

  /// Make your own appbar. Pass ViitAppBarIcon enum icon type to specify
  /// which leading icon you want.
  ViitAppBar({
    Key key,
    @required this.leadingWidget,
    @required this.titleWidget,
    @required this.onLeadingPressed,
    this.isActionWidget = false,
    this.actionWidget,
    this.onActionPressed,
    this.isTransparent = false,
  })  : preferredSize = Size.fromHeight(82.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8),
      color: kPrimaryColor,
      height: preferredSize.height,
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: onLeadingPressed,
            child: leadingWidget,
          ),
//          Expanded(child: titleWidget,),
          Expanded(
            flex: 1,
            child: titleWidget,
          ),
          isActionWidget
              ? GestureDetector(
                  onTap: onActionPressed,
                  child: actionWidget,
                )
              : SizedBox()
        ],
      ),
    );
  }
}

class ViitAppBarIconWidget extends StatelessWidget {
  final ViitAppBarIconTypes viitAppBarIconType;
  final Widget myLeadingIcon;
  final Color bgColor;
  final Color iconColor;

  ViitAppBarIconWidget({
    this.viitAppBarIconType = ViitAppBarIconTypes.BACK,
    this.myLeadingIcon,
    this.bgColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    Widget myLeadingWidget;

    switch (viitAppBarIconType) {
      case ViitAppBarIconTypes.BACK:
        myLeadingWidget = Icon(
          Icons.arrow_back_ios,
          color: iconColor != null ? iconColor : kPrimaryColor,
        );
        break;
      case ViitAppBarIconTypes.MENU:
        myLeadingWidget = Icon(
          Icons.menu,
          color: iconColor != null ? iconColor : kPrimaryColor,
        );
        break;
      case ViitAppBarIconTypes.ICON:
        myLeadingWidget = myLeadingIcon;
        break;
      default:
        myLeadingWidget = SizedBox();
    }

    return Container(
      margin: const EdgeInsets.all(14),
      height: 38,
      width: 38,
      decoration: BoxDecoration(
        color: bgColor != null ? bgColor : Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: myLeadingWidget,
    );
  }
}

class ViitTitleWidget extends StatelessWidget {
  final String title;

  ViitTitleWidget(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.title.copyWith(
            color: Colors.white,
            fontSize: 22,
          ),
    );
  }
}

enum ViitAppBarIconTypes { NONE, BACK, MENU, ICON }
