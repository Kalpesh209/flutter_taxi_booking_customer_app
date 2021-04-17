import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';
import 'package:flutter_taxi_booking_customer_app/common/viiticons_icons.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/book_taxi/location_information/bottom_sheets/good_to_see_you_bottomsheet.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/book_taxi/location_information/where_to/where_to_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/book_taxi/vehicle_information_screen/vehicle_information_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/common/add_address_to_mylist/add_address_to_mylist.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/add_location_suggestion_widget.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/date_selection_container.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/flat_button_widget.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/from_to_location_card_widget.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/viit_appbar.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


import 'bloc/bloc.dart';

class LocationInformation extends StatefulWidget {
  @override
  _LocationInformationState createState() => _LocationInformationState();
}

class _LocationInformationState extends State<LocationInformation> {
  Completer<GoogleMapController> _controller = Completer();
  var tripEnd = false;
  LocationInformationBloc _locationInformationBloc;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay(
    hour: DateTime.now().hour,
    minute: DateTime.now().minute,
  );

  List<String> myWeekDays = [
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
    "Sun",
  ];
  List<String> myMonths = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Otc",
    "Nov",
    "Dec"
  ];

  static CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(
      37.42796133580664,
      -122.085749655962,
    ),
    zoom: 12.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(
      37.43296265331129,
      -122.08832357078792,
    ),
    tilt: 59.440717697143555,
    zoom: 12.151926040649414,
  );

  List<String> addressLabels = [
    "Add Home\nAddress",
    "Add Work\nAddress",
    "Add Gym\nAddress",
    "Add Loved One\nAddress",
  ];

  List<IconData> addressIcons = [
    Viiticons.home,
    Viiticons.work,
    Viiticons.face,
    Icons.favorite,
  ];

  List<IconData> favAddIcons = [Viiticons.home, Viiticons.work, Viiticons.home];
  List<String> favAddTitle = ["Home", "Work", "Gym"];
  List<String> favAddAddresses = [
    "50, rue des Lacs, 83400 HYERESS",
    "19, rue La Boétie 75016 PARIS",
    "66, avenue Ferdinand de Lesseps 33170"
  ];

  @override
  Future<void> initState() {
    super.initState();
    print("LocationInformation() init");
    _locationInformationBloc =
        BlocProvider.of<LocationInformationBloc>(context);
    _locationInformationBloc.add(IsLocationSelFinish(flag: false));

    Future<Position> position = Geolocator().getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);

    position.then((onValue) {
      _kGooglePlex = CameraPosition(
        target: LatLng(
          onValue.latitude,
          onValue.longitude,
        ),
        zoom: 12.4746,
      );
      setState(() {});
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("LocationInformation() didChangeDependencies");
  }

  @override
  void dispose() {
    super.dispose();
    print("LocationInformation() dispose");
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        //Google map
        GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),

        // Top left menu icon
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 8, top: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: ViitAppBarIconWidget(
                    viitAppBarIconType: ViitAppBarIconTypes.MENU,
                    bgColor: kPrimaryColor,
                    iconColor: Colors.white,
                  ),
                ),
                //Top location selection done card

                BlocBuilder<LocationInformationBloc, LocationInformationState>(
                  builder: (context, state) {
                    if (state is ShowNextButton) {
                      return Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: FromToLocationCard(
                          fromLocation: "54, rue du Gue Jacquet",
                          toLocation: "38, rue des Nations",
                          isPlusVisible: false,
                        ),
                      );
                    } else {
                      return SizedBox();
                    }
                  },
                ),
              ],
            ),
          ),
        ),

        //Bottom location add suggestion
        BlocBuilder<LocationInformationBloc, LocationInformationState>(
          builder: (context, state) {
            print("$state");
            if (state is ShowNextButton) {
              return Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(21.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: FlatButtonWidget(
                            btnTxt: "Next",
                            btnColor: kAccentColor,
                            btnOnTap: () {
                              print("Goto vehicle selection");
                              Navigator.of(context).pushNamed(
                                VehicleInformationScreen.routeName,
                                arguments: VehicleInformationScreenArguments(
                                  fromLoc: "",
                                  toLoc: "",
                                ),
                              );
                            },
                          ),
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: FlatButtonWidget(
                          btnTxt: "Schedule",
                          btnColor: kPrimaryColor,
                          btnOnTap: () {
                            print("Add trip into schedule");
                          },
                        ),
                        flex: 1,
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is ShowAddLocationState) {
              return Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.white,
                  height: 121,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      AddLocationSuggestionWidget(
                        iconData: addressIcons[0],
                        text: addressLabels[0],
                        myOnTap: () {
                          Navigator.of(context).pushNamed(
                            AddAddressToMylistScreen.routeName,
                            arguments: AddAddressToMylistScreenArguments(
                              toolbarTitle: "Add Home Address",
                              hintText: "Enter home address",
                            ),
                          );
                        },
                      ),
                      AddLocationSuggestionWidget(
                        iconData: addressIcons[1],
                        text: addressLabels[1],
                        myOnTap: () {
                          Navigator.of(context).pushNamed(
                            AddAddressToMylistScreen.routeName,
                            arguments: AddAddressToMylistScreenArguments(
                              toolbarTitle: "Add Work Address",
                              hintText: "Enter work address",
                            ),
                          );
                        },
                      ),
                      AddLocationSuggestionWidget(
                        iconData: addressIcons[2],
                        text: addressLabels[2],
                        myOnTap: () {
                          Navigator.of(context).pushNamed(
                            AddAddressToMylistScreen.routeName,
                            arguments: AddAddressToMylistScreenArguments(
                              toolbarTitle: "Add Gym Address",
                              hintText: "Enter gym address",
                            ),
                          );
                        },
                      ),
                      AddLocationSuggestionWidget(
                        iconData: addressIcons[3],
                        text: addressLabels[3],
                        myOnTap: () {
                          Navigator.of(context).pushNamed(
                            AddAddressToMylistScreen.routeName,
                            arguments: AddAddressToMylistScreenArguments(
                              toolbarTitle: "Add Loved One Address",
                              hintText: "Enter loved one address",
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is ShowGoodToSeeYouState) {
              return Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: screenHeight * 0.45,
                  padding: const EdgeInsets.only(
                    left: 21,
                    right: 21,
                    top: 21,
                    bottom: 0,
                  ),
                  color: Colors.white,
                  child: GoodToSeeYouBottomSheet(
                    myOnLocationSelection: (i) {
                      _locationInformationBloc
                          .add(IsLocationSelFinish(flag: true));
                    },
                    myOnScheduleTap: () {
                      showBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: screenHeight * 0.45,
                              padding: const EdgeInsets.only(
                                  left: 21, right: 21, top: 21),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Text(
                                    "Schedule a Ride",
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption
                                        .copyWith(
                                          color: kLoginBlack,
                                          fontSize: 20,
                                          letterSpacing: 0.47,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  SizedBox(
                                    height: 21,
                                  ),
                                  DateSelectionContainer(
                                    myText:
                                        "${myWeekDays[selectedDate.weekday - 1]}, ${selectedDate.day.toString().padLeft(2, '0')} ${myMonths[selectedDate.month - 1]}",
                                    myOnTap: () async {
                                      final DateTime picked =
                                          await showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(2015, 8),
                                              lastDate: DateTime(2101));
                                      if (picked != null &&
                                          picked != selectedDate)
                                        setState(
                                          () {
                                            selectedDate = picked;
                                          },
                                        );
                                    },
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  DateSelectionContainer(
                                    myText:
                                        "${selectedTime.hourOfPeriod} : ${selectedTime.minute} ${selectedTime.period == DayPeriod.am ? 'AM' : 'PM'}",
                                    myOnTap: () async {
                                      final TimeOfDay picked =
                                          await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay(
                                          hour: DateTime.now().hour,
                                          minute: DateTime.now().minute,
                                        ),
                                      );
                                      if (picked != null &&
                                          picked != selectedTime) {
                                        setState(() {
                                          selectedTime = picked;
                                        });
                                      }
                                    },
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  FlatButtonWidget(
                                    btnTxt: "Set Pickup Time",
                                    btnColor: kAccentColor,
                                    btnOnTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    height: 56,
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                    myOnWhereToTap: () async {
                      var result = await Navigator.of(context).pushNamed(
                        WhereToScreen.routeName,
                        arguments: WhereToScreenArguments(),
                      );
                      if (result) {
                        _locationInformationBloc.add(
                          IsLocationSelFinish(flag: true),
                        );
                      }
                    },
                  ),
                ),
              );
            } else if (state is LoadingState) {
              return Align(
                alignment: Alignment.bottomCenter,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return Center(
                child: Text("Unhandled state"),
              );
            }
          },
        )
      ],
    );
  }
}
