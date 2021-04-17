
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';
import 'package:flutter_taxi_booking_customer_app/common/viiticons_icons.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/flat_button_widget.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/from_to_location_card_widget.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/recent_address_item_list.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/viit_appbar.dart';

import 'bloc/bloc.dart';

class WhereToScreen extends StatelessWidget {
  static const String routeName = "whereto";
  WhereToScreenArguments arguments;

  WhereToScreen({
    this.arguments,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: WhereTo(),
      create: (context) => WhereToBloc(),
    );
  }
}

class WhereTo extends StatefulWidget {
  @override
  _WhereToState createState() => _WhereToState();
}

class _WhereToState extends State<WhereTo> {
  WhereToBloc whereToBloc;

  List<IconData> addIcons = [
    Viiticons.home,
    Viiticons.star,
    Viiticons.history,
    Viiticons.history,
    Viiticons.history,
    Viiticons.history,
    Viiticons.history,
  ];
  List<String> addTitles = [
    "Home",
    "Saved Places",
    "Red Bus Stop",
    "Rue La",
    "Beauchesne",
    "Rue des Lacs",
    "Rue des Lacs"
  ];
  List<String> addAdd = [
    "66, avenue Ferdinand de Lesseps 33170 GRADIGNAN",
    "",
    "38, rue des Nations Unies SAINT",
    "19, rue La Boétie 75016 PARIS",
    "52, rue Gouin de Beauchesne NAZAIRE",
    "50, rue des Lacs, 83400 HYÈRES",
    "50, rue des Lacs, 83400 HYÈRES"
  ];

  @override
  void initState() {
    super.initState();
    print("WhereTo() init");
    whereToBloc = BlocProvider.of<WhereToBloc>(context);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("WhereTo() didChangeDependencies");
  }

  @override
  void dispose() {
    super.dispose();
    print("WhereTo() dispose");
    whereToBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            //Top container
            Container(
              height: 140,
              color: kPrimaryColor,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                  top: 8,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop(false);
                      },
                      child: ViitAppBarIconWidget(
                        viitAppBarIconType: ViitAppBarIconTypes.BACK,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12,right: 2),
                      child: FromToLocationCard(
                        fromLocation: "54, rue du Gue Jacquet",
                        toLocation: "Destination",
                        onTapSwitch: (){
                          print("Switch address");
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //Fav places
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 4),
                child: ListView.builder(
                  itemCount: addTitles.length,
                  itemBuilder: (context, index) => Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).pop(true);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 21, vertical: 8),
                          child: RecentAddressItemList(
                            addressTitle: addTitles[index],
                            myBackgrounColor: index == 0 ? kAccentColor : kGrey,
                            myIcon: addIcons[index],
                            myIconColor:
                                index == 0 ? Colors.white : kTextLoginfaceid,
                            address: addAdd[index],
                          ),
                        ),
                      ),
                      index == addTitles.length - 1
                          ? SizedBox()
                          : index == 1
                              ? Container(
                                  height: 6,
                                  margin: const EdgeInsets.only(
                                    top: 6,
                                    bottom: 6,
                                  ),
                                  color: kSettingDivider,
                                )
                              : Container(
                                  height: 0.5,
                                  margin: const EdgeInsets.only(
                                    top: 6,
                                    left: 62,
                                    right: 16,
                                    bottom: 6,
                                  ),
                                  color: kGrey,
                                ),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                top: 4,
                left: 26,
                right: 26,
                bottom: 16,
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: FlatButtonWidget(
                      btnColor: kAccentColor,
                      btnTxt: "Next",
                      btnOnTap: () {
                        Navigator.of(context).pop(true);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WhereToScreenArguments {}
