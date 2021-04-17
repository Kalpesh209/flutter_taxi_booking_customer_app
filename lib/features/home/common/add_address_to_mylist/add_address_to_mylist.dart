import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';
import 'package:flutter_taxi_booking_customer_app/common/viiticons_icons.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/common/add_address_to_mylist/bloc/add_address_to_mylist_bloc.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/common/location_from_map/location_from_map_screen.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/recent_address_item_list.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/square_add_location_textfield_widget.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/viit_appbar.dart';


class AddAddressToMylistScreen extends StatelessWidget {
  static const String routeName = "addaddresstomylist";
  AddAddressToMylistScreenArguments arguments;

  AddAddressToMylistScreen({
    this.arguments,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: AddAddressToMylist(arguments),
      create: (context) => AddAddressToMylistBloc(),
    );
  }
}

class AddAddressToMylist extends StatefulWidget {
  AddAddressToMylistScreenArguments arguments;

  AddAddressToMylist(
    this.arguments,
  );

  @override
  _AddAdressToMylistState createState() => _AddAdressToMylistState();
}

class _AddAdressToMylistState extends State<AddAddressToMylist> {
  AddAddressToMylistBloc addAddressToMylistBloc;
  List<IconData> favAddIcons = [
    Viiticons.history,
    Viiticons.history,
    Icons.star,
    Viiticons.history,
    Viiticons.history,
    Icons.location_on,
  ];
  List<String> favAddTitle = [
    "Rue des Lacs",
    "Avenue Ferdinand",
    "Red Bus Stop",
    "Beauchesne",
    "Rue des Lacs",
    "Set location on map"
  ];
  List<String> favAddAddresses = [
    "50, rue des Lacs, 83400 HYERESS",
    "19, rue La Boétie 75016 PARIS",
    "66, avenue Ferdinand de Lesseps 33170",
    "66, avenue Ferdinand de Lesseps 33170",
    "66, avenue Ferdinand de Lesseps 33170",
    "",
  ];

  @override
  void initState() {
    super.initState();
    print("AddAddressToMylist() init");
    addAddressToMylistBloc = BlocProvider.of<AddAddressToMylistBloc>(context);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("AddAddressToMylist() didChangeDependencies");
  }

  @override
  void dispose() {
    super.dispose();
    print("AddAddressToMylist() dispose");
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
        body: Padding(
          padding: const EdgeInsets.all(21.0),
          child: Column(
            children: <Widget>[
              SquareAddLocationTextFieldWidget(
                inputType: TextInputType.text,
                inputAction: TextInputAction.done,
                hintText: widget.arguments.hintText,
                onChanged: (str) {
                  print("");
                },
                onFabTap:(){
                  Navigator.of(context).pop();
                  /*Navigator.of(context).pushNamed(
                    LocationFromMapScreen.routeName,
                    arguments: LocationFromMapScreenArguments(
                      toolbarTitle: widget.arguments.toolbarTitle,
                      hintText: widget.arguments.hintText,
                    ),
                  );*/
                }
              ),
              SizedBox(
                height: 16,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: favAddTitle.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      if (index == (favAddTitle.length - 1)) {
                        Navigator.of(context).pushNamed(
                          LocationFromMapScreen.routeName,
                          arguments: LocationFromMapScreenArguments(
                            toolbarTitle: "Add Work Address",
                            hintText: "Enter work address",
                          ),
                        );
                      }else{
                        Navigator.of(context).pop();
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          RecentAddressItemList(
                            addressTitle: favAddTitle[index],
                            myIcon: favAddIcons[index],
                            address: favAddAddresses[index],
                            myBackgrounColor: kSettingFavAddAvtarBg,
                            myIconColor: kTextLoginfaceid,
                            isLastIndex: index == (favAddTitle.length - 1),
                          ),
                          index == (favAddTitle.length - 1)
                              ? SizedBox()
                              : Container(
                                  height: 0.5,
                                  margin: const EdgeInsets.only(
                                    top: 14,
                                    left: 46,
                                    right: 16,
                                  ),
                                  color: kGrey,
                                )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddAddressToMylistScreenArguments {
  final String toolbarTitle;
  final String hintText;

  AddAddressToMylistScreenArguments({
    this.toolbarTitle,
    this.hintText,
  });
}
