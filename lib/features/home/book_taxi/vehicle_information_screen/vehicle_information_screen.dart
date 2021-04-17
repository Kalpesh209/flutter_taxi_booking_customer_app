import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';
import 'package:flutter_taxi_booking_customer_app/common/viiticons_icons.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/book_taxi/ongoing_trip/ratting/ratting_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/book_taxi/vehicle_information_screen/payment_method/payment_option.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/viit_appbar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class VehicleInformationScreen extends StatelessWidget {
  static const String routeName = "vehicleinformation";
  final VehicleInformationScreenArguments arguments;

  VehicleInformationScreen({this.arguments});

  @override
  Widget build(BuildContext context) {
    return VehicleInformation();
  }
}

class VehicleInformation extends StatefulWidget {
  @override
  _VehicleInformationState createState() => _VehicleInformationState();
}

class _VehicleInformationState extends State<VehicleInformation> {
  Completer<GoogleMapController> _controller = Completer();

  static CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(
      37.42796133580664,
      -122.085749655962,
    ),
    zoom: 12.4746,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            //Google map
            GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),

            //Back arrow
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 8, top: 8),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: ViitAppBarIconWidget(
                    viitAppBarIconType: ViitAppBarIconTypes.BACK,
                    bgColor: kPrimaryColor,
                    iconColor: Colors.white,
                  ),
                ),
              ),
            ),

            //For me, payment and promo
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    color: Color(0XFFD8D8D8),
                    height: 1,
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(RattingScreen.routeName);
                    },
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "For me",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.caption.copyWith(
                                  color: kPrimaryColor,
                                  fontSize: 15,
                                ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: kPrimaryColor,
                            size: 20,
                          )
                        ],
                      ),
                      height: 36,
                      width: double.infinity,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    color: Color(0XFFD8D8D8),
                    height: 1,
                  ),
                  Container(
                    color: Color(0XFFFFF1F3F7),
                    height: 62,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: ListTileWithLessPadding(
                            myOnTap: () {
                              Navigator.of(context)
                                  .pushNamed(PaymentOptionScreen.routeName);
                            },
                            myIcon: Icon(
                              Viiticons.payment,
                              size: 34,
                              color: kPrimaryColor,
                            ),
                            myText: "Payment",
                          ),
                        ),
                        VerticalDivider(
                          color: Color(0XFFD8D8D8),
                        ),
                        Expanded(
                          flex: 1,
                          child: ListTileWithLessPadding(
                            myOnTap: () {
                              // showDialog(
                              //   context: context,
                              //   child: PromoBoxWidget(
                              //     titleText: "Apply Promo Code",
                              //     secondaryBtnTxt: "Cancel",
                              //     primaryBtnTxt: "Apply",
                              //     onPrimaryTap: () {
                              //       Navigator.of(context).pop();
                              //     },
                              //     onSecondaryTap: () {
                              //       Navigator.of(context).pop();
                              //     },
                              //   ),
                              // );
                            },
                            myIcon: Icon(
                              Viiticons.promo,
                              size: 34,
                              color: kPrimaryColor,
                            ),
                            myText: "Promo",
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class VehicleInformationScreenArguments {
  final String fromLoc;
  final String toLoc;

  VehicleInformationScreenArguments({
    this.fromLoc,
    this.toLoc,
  });
}

class ListTileWithLessPadding extends StatelessWidget {
  final Icon myIcon;
  final String myText;
  final VoidCallback myOnTap;

  ListTileWithLessPadding({
    this.myIcon,
    this.myText,
    this.myOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: myOnTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          myIcon,
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              myText,
              style: Theme.of(context).textTheme.caption.copyWith(
                    color: kLoginBlack,
                    fontSize: 15,
                    letterSpacing: 0.21,
                  ),
            ),
          )
        ],
      ),
    );
  }
}
