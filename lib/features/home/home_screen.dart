

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/book_taxi/location_information/bloc/location_information_bloc.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/book_taxi/location_information/location_information_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/feel_good/feel_good_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/free_rides/free_rides_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/help_support/help_support_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/home_nav_drawer.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/loyalty_program/loyalty_program_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/myrides/my_rides_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/notification/notifications_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/payment/payment_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/profile/profile_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/settings/settings_screen.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/viit_appbar.dart';


import 'bloc/bloc.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "home";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: Home(),
      create: (context) => HomeBloc(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var myCurrentNavIndex = 0;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  HomeBloc homeBloc;

  @override
  void initState() {
    super.initState();
    homeBloc = BlocProvider.of<HomeBloc>(context);
    homeBloc.add(
      CheckLocPer(),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
    homeBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: MyNavDrawer(
          context: context,
          myListItems: _buildItems(),
          currentSelectedNavItem: myCurrentNavIndex,
          onProfileTap: () {
            print("Clicked on profile...");
            setState(
              () {
                myCurrentNavIndex = 9; //Profile index onTap
              },
            );

            Navigator.of(context).pop();
          },
          onNavItemChange: (int tapedIndex) {
            print("I am tapped with $tapedIndex");
            setState(() {
              // if (tapedIndex == 6) {
              //   //Goto Login screen
              //   print("Goto Login screen");
              // } else {
              myCurrentNavIndex = tapedIndex;
              Navigator.of(context).pop();
              // }
            });
          },
        ),
        appBar: myCurrentNavIndex != 0
            ? ViitAppBar(
                leadingWidget: ViitAppBarIconWidget(
                  viitAppBarIconType: ViitAppBarIconTypes.MENU,
                ),
                titleWidget: ViitTitleWidget(
                  _getAppBarTitleByIndex(myCurrentNavIndex),
                ),
                onLeadingPressed: () {
                  print("Leading click");
                  _scaffoldKey.currentState.openDrawer();
                },
                isActionWidget: myCurrentNavIndex == 7,
                onActionPressed: () {},
                actionWidget: Padding(
                  padding: const EdgeInsets.only(
                    right: 6,
                  ),
                  child: Icon(
                    CupertinoIcons.delete,
                    size: 31,
                    color: Colors.white,
                  ),
                ),
              )
            : null,
        body: BlocListener<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is AskLocationDialog) {
              print("Ask location dialog");
              // showDialog(
              //   context: context,
              //   child: DialogBoxWidget(
              //     titleText:
              //         "Allow “Vitt” to access your location while you are using the app?",
              //     descriptionText:
              //         "Allow Vitt experiences to use your location",
              //     primaryBtnTxt: "Allow",
              //     secondaryBtnTxt: "Don’t Allow",
              //     onPrimaryTap: () {
              //       Navigator.of(context).pop();
              //       homeBloc.add(
              //         AskLocationDialogEvent(),
              //       );
              //     },
              //     onSecondaryTap: () {
              //       Navigator.of(context).pop();
              //       /*homeBloc.add(
              //         CheckLocPer(),
              //       );*/
              //     },
              //   ),
              // );
            }
          },
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return _buildNavBodyByIndex(
                myCurrentNavIndex,
                context,
              );
            },
          ),
        ),

        /*_buildNavBodyByIndex(
            myCurrentNavIndex,
            context,
          )*/
      ),
    );
  }

  _getAppBarTitleByIndex(paramTapedIndex) {
    switch (paramTapedIndex) {
      case 1: // MyRides
        return "My Rides";
        break;
      case 2: // Payment
        return "Payment";
        break;
      case 3: // Free Rides
        return "Free Rides";
        break;
      case 4: // Loyalty Program
        return "Loyalty Program";
        break;
      case 5: // Feel Good
        return "Feel Good";
        break;
      case 6: // Help & Support
        return "Help & Support";
        break;
      case 7: // Notifications
        return "Notifications";
        break;
      case 8: // Settings
        return "Settings";
        break;
      case 9: // Settings
        return "Edit Profile";
        break;
      default: // default home
        return "Home";
        break;
    }
  }

  _buildNavBodyByIndex(paramTapedIndex, buildContext) {
    switch (paramTapedIndex) {
      case 1: // MyRides
        return MyRidesScreen();
        break;
      case 2: // Payment
        return PaymentScreen();
        break;
      case 3: // Free Rides
        return FreeRides();
        break;
      case 4: // Loyalty Program
        return LoyaltyProgramScreen();
        break;
      case 5: // Feel Good
        return FeelGoodScreen();
        break;
      case 6: // Help & Support
        return HelpSupportScreen();
        break;
      case 7: // Notifications
        return NotificationsScreen();
        break;
      case 8: // Settings
        return SettingsScreen();
        break;
      case 9: // Profile
        return ProfileScreen();
        break;
      default: // default home
        return BlocProvider(
          child: LocationInformation(),
          create: (context) => LocationInformationBloc(),
        );
        break;
    }
  }

  _buildLoadingState() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  _buildErrorState(errorMsg) {
    return Center(
      child: Container(
        child: Text("$errorMsg"),
      ),
    );
  }

  _buildItems() {}
}

/*class MapLoader extends StatefulWidget {
  @override
  _MapLoaderState createState() => _MapLoaderState();
}

class _MapLoaderState extends State<MapLoader> {
  Completer<GoogleMapController> _controller = Completer();
  var tripEnd = false;

  static CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Future<void> initState() {
    super.initState();
    print("MapLoader() init");
    Future<Position> position = Geolocator().getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);

    position.then((onValue) {
      _kGooglePlex = CameraPosition(
        target: LatLng(
          onValue.latitude,
          onValue.longitude,
        ),
        zoom: 14.4746,
      );
      setState(() {});
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("MapLoader() didChangeDependencies");
  }

  @override
  void dispose() {
    super.dispose();
    print("MapLoader() dispose");
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 8, top: 8),
            child: GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: ViitAppBarIconWidget(
                viitAppBarIconType: ViitAppBarIconTypes.MENU,
                bgColor: kPrimaryColor,
                iconColor: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}*/
