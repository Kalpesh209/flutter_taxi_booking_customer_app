import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';
import 'package:flutter_taxi_booking_customer_app/common/viiticons_icons.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/nav_menu_item.dart';


class MyNavDrawer extends StatelessWidget {
  final BuildContext context;
  final List<NavItemModel> myListItems;
  final Function(int) onNavItemChange;
  final VoidCallback onProfileTap;
  final currentSelectedNavItem;

  MyNavDrawer({
    Key key,
    @required this.context,
    this.myListItems,
    @required this.onNavItemChange,
    @required this.onProfileTap,
    this.currentSelectedNavItem = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.75,
      child: Drawer(
        child: Stack(
          children: <Widget>[
            //Profile and navigation menus
            Align(
              alignment: Alignment.topCenter,
              child: ListView(
                children: <Widget>[
                  buildProfile(),
                  SizedBox(
                    height: 6,
                  ),
                  NavMenuItem(
                    myOnTap: () {
                      onNavItemChange(0);
                    },
                    context: context,
                    title: "Home",
                    icon: Viiticons.home,
                    iconSize: 25,
                    navDecorationType: currentSelectedNavItem == 0
                        ? NavItemDecorationType.SELECTED
                        : NavItemDecorationType.NONE,
                  ),
                  NavMenuItem(
                    myOnTap: () {
                      onNavItemChange(1);
                    },
                    context: context,
                    title: "My Rides",
                    icon: Viiticons.my_rides,
                    iconSize: 22,
                    navDecorationType: currentSelectedNavItem == 1
                        ? NavItemDecorationType.SELECTED
                        : NavItemDecorationType.NONE,
                  ),
                  NavMenuItem(
                    myOnTap: () {
                      onNavItemChange(2);
                    },
                    context: context,
                    title: "Payment",
                    icon: Viiticons.payment,
                    navDecorationType: currentSelectedNavItem == 2
                        ? NavItemDecorationType.SELECTED
                        : NavItemDecorationType.NONE,
                  ),
                  NavMenuItem(
                    myOnTap: () {
                      onNavItemChange(3);
                    },
                    context: context,
                    title: "Free Rides",
                    icon: Viiticons.my_rides,
                    iconSize: 22,
                    navDecorationType: currentSelectedNavItem == 3
                        ? NavItemDecorationType.SELECTED
                        : NavItemDecorationType.NONE,
                  ),
                  NavMenuItem(
                    myOnTap: () {
                      onNavItemChange(4);
                    },
                    context: context,
                    title: "Loyalty Program",
                    icon: Viiticons.loyalty_program,
                    navDecorationType: currentSelectedNavItem == 4
                        ? NavItemDecorationType.SELECTED
                        : NavItemDecorationType.NONE,
                  ),
                  NavMenuItem(
                    myOnTap: () {
                      onNavItemChange(5);
                    },
                    context: context,
                    title: "Feel Good",
                    icon: Viiticons.feel_good,
                    navDecorationType: NavItemDecorationType.HIGHLIGHTED,
                  ),
                  NavMenuItem(
                    myOnTap: () {
                      onNavItemChange(6);
                    },
                    context: context,
                    title: "Help & Support",
                    icon: Viiticons.help_support,
                    navDecorationType: currentSelectedNavItem == 6
                        ? NavItemDecorationType.SELECTED
                        : NavItemDecorationType.NONE,
                  ),
                  NavMenuItem(
                    myOnTap: () {
                      onNavItemChange(7);
                    },
                    context: context,
                    title: "Notifications",
                    icon: Viiticons.notification,
                    navDecorationType: currentSelectedNavItem == 7
                        ? NavItemDecorationType.SELECTED
                        : NavItemDecorationType.NONE,
                  ),
                  NavMenuItem(
                    myOnTap: () {
                      onNavItemChange(8);
                    },
                    context: context,
                    title: "Settings",
                    icon: Viiticons.settings,
                    navDecorationType: currentSelectedNavItem == 8
                        ? NavItemDecorationType.SELECTED
                        : NavItemDecorationType.NONE,
                  ),
                  SizedBox(
                    height: 62,
                  ),
                ],
              ),
            ),

            //Bottom drive with viit
            buildBottomBadge(),
          ],
        ),
      ),
    );
  }

  buildBottomBadge() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.only(
          left: 32,
        ),
        color: kAccentColor,
        height: 48,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.person,
              color: Colors.white,
              size: 28,
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              "Drive with Viit",
              style: Theme.of(context).textTheme.subtitle.copyWith(
                    color: Colors.white,
                    fontSize: 16,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  buildProfile() {
    return GestureDetector(
      onTap: onProfileTap,
      child: ClipPath(
        clipper: BottomProfileWaveClipper(),
        child: Container(
          padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0.0),
          decoration: BoxDecoration(
            color: kPrimaryColor,
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 42,
            ),
            child: ListTile(
              leading: Image(
                image: AssetImage('assets/female_avtar.png'),
                fit: BoxFit.cover,
              ),
              title: Text(
                "Melissa Brunt",
                style: Theme.of(context).textTheme.title.copyWith(
                      fontSize: 18,
                      color: Colors.white,
                    ),
              ),
              subtitle: Container(
                margin: const EdgeInsets.only(top: 6),
                child: Row(
                  children: <Widget>[
                    RatingBar(
                      ignoreGestures: true,
                      initialRating: 4,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                      itemSize: 18,
                      // itemBuilder: (context, _) => Icon(
                      //   Icons.star,
                      //   color: Colors.amber,
                      // ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      "4.3",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle
                          .copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

typedef void MyNavItemTap(int foo);

class NavItemModel {
  IconData iconData;
  String title;
}

class BottomProfileWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height);
    var firstControlPoint = Offset(size.width / 3, size.height - 50);
    var firstEndPoint = Offset(size.width / 1.5, size.height - 20);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    var secondControlPoint = Offset((size.width) - 40, size.height);
    var secondEndPoint = Offset(size.width, size.height);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    //path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
