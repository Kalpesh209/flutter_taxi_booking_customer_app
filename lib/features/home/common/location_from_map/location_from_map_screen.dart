import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';
import 'package:flutter_taxi_booking_customer_app/common/viiticons_icons.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/square_add_location_textfield_widget.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/viit_appbar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


import 'bloc/bloc.dart';

/*class LocationFromMapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}*/

class LocationFromMapScreen extends StatelessWidget {
  static const String routeName = "locationfrommap";

  LocationFromMapScreenArguments arguments;

  LocationFromMapScreen({
    this.arguments,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: LocationFromMap(arguments),
      create: (context) => LocationFromMapBloc(),
    );
  }
}

class LocationFromMap extends StatefulWidget {
  LocationFromMapScreenArguments arguments;

  LocationFromMap(this.arguments);

  @override
  _LocationFromMapState createState() => _LocationFromMapState();
}

class _LocationFromMapState extends State<LocationFromMap> {
  LocationFromMapBloc addAddressToMylistBloc;
  static CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(
      37.42796133580664,
      -122.085749655962,
    ),
    zoom: 14.4746,
  );

  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
    print("LocationFromMap() init");
    addAddressToMylistBloc = BlocProvider.of<LocationFromMapBloc>(context);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("LocationFromMap() didChangeDependencies");
  }

  @override
  void dispose() {
    super.dispose();
    print("LocationFromMap() dispose");
    addAddressToMylistBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: ViitAppBar(
          onLeadingPressed: () {
            Navigator.of(context).pop();
          },
          leadingWidget: ViitAppBarIconWidget(
            viitAppBarIconType: ViitAppBarIconTypes.BACK,
          ),
          titleWidget: ViitTitleWidget(
            widget.arguments.toolbarTitle,
          ),
        ),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              onCameraMove: (CameraPosition cameraPosition) {
                print("Latitude: ${cameraPosition.target.latitude}");
                print("Latitude: ${cameraPosition.target.longitude}");
              },
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(21),
                child: SquareAddLocationTextFieldWidget(
                    inputType: TextInputType.text,
                    inputAction: TextInputAction.done,
                    hintText: widget.arguments.hintText,
                    onChanged: (str) {
                      print("");
                    },
                    onFabTap: () {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    }),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Icon(
                Viiticons.location,
                size: 51,
                color: kAccentColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LocationFromMapScreenArguments {
  final String toolbarTitle;
  final String hintText;

  LocationFromMapScreenArguments({
    this.toolbarTitle,
    this.hintText,
  });
}
