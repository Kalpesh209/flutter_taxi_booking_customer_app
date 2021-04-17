import 'package:flutter/material.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/settings/fav_address/edit_fav_address_screen.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/recent_address_item_list.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/slide_menu_widget.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/viit_appbar.dart';


class FavAddressScreen extends StatelessWidget {
  static const String routeName = "favaddress";
  List<String> addressTitle = [
    "Rue des Lacs",
    "Red Bus Stop",
    "Rue La",
    "Beauchesne",
    "Rue des Lacs"
  ];
  List<String> addressDesc = [
    "50, rue des Lacs, 83400 HYÈRES",
    "66, avenue Ferdinand de Lesseps 33170 GRADIGNAN",
    "38, rue des Nations Unies SAINT",
    "19, rue La Boétie 75016 PARIS",
    "52, rue Gouin de Beauchesne",
    "50, rue des Lacs, 83400 HYÈRES"
  ];

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
          titleWidget: ViitTitleWidget("Favourite Address"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              itemCount: addressTitle.length,
              itemBuilder: (BuildContext context, int index) {
                return SlideMenu(
                  child: ListTile(
                    title: Column(
                      children: <Widget>[
                        RecentAddressItemList(
                          address: addressDesc[index],
                          addressTitle: addressTitle[index],
                          myBackgrounColor: kGrey,
                          myIcon: Icons.star,
                          myIconColor: kTextLoginfaceid,
                          isLastIndex: false,
                          isShowEditIcon: true,
                          myOnEditIconTap: () {
                            Navigator.of(context).pushNamed(
                              EditFavAddressScreen.routeName,
                            );
                          },
                        ),
                        index == (addressTitle.length - 1)
                            ? SizedBox()
                            : Container(
                                height: 0.5,
                                margin: const EdgeInsets.only(
                                    top: 14, left: 46, right: 16),
                                color: kSettingDivider,
                              )
                      ],
                    ),
                  ),
                  menuItems: <Widget>[
                    Container(
                      color: kDanger,
                      child: Center(
                        child: Text(
                          "Delete",
                          style: Theme.of(context).textTheme.caption.copyWith(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}

/*class RecentAddressItemList extends StatelessWidget {
  final String addressTitle;
  final String address;
  final IconData myIcon;
  final Color myIconColor;
  final Color myBackgrounColor;

  RecentAddressItemList({
    this.addressTitle,
    this.address,
    this.myIcon,
    this.myIconColor,
    this.myBackgrounColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              color: myBackgrounColor,
              borderRadius: BorderRadius.circular(40 / 2)),
          child: Center(
            child: Icon(
              myIcon,
              size: 25,
              color: myIconColor,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "$addressTitle",
              style: Theme.of(context).textTheme.caption.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 16),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "$address",
              style: Theme.of(context)
                  .textTheme
                  .caption
                  .copyWith(color: Colors.black12, fontSize: 14),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 0.5,
              width: MediaQuery.of(context).size.width - 90,
              color: Colors.grey,
              child: Row(),
            ),
          ],
        ),
      ],
    );
  }
}*/
