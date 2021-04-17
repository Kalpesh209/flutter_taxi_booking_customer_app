import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/slide_menu_widget.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/viit_appbar.dart';


class FavDriverScreen extends StatelessWidget {
  static const String routeName = "favdriver";

  List<String> names = ["Gail Watkins", "Chad Sims", "Michael Liao"];

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
          titleWidget: ViitTitleWidget("Favourite Drivers"),
        ),
        body: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return SlideMenu(
                child: new ListTile(
                  title: new Container(
                    child: FavouriteDriverWidget(
                      nameTxt: "${names[index]}",
                      assetImagePath: index % 2 == 0
                          ? 'assets/male_avtar.png'
                          : 'assets/female_avtar.png',
                      startVal: (index + 3).toDouble(),
                    ),
                  ),
                ),
                menuItems: <Widget>[
                  new Container(
                    color: Colors.red,
                    child: Center(
                      child: Text(
                        "Delete",
                        style: Theme.of(context).textTheme.caption.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Color(0XFFffffff),
                            fontSize: 15),
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}

class FavouriteDriverWidget extends StatelessWidget {
  final String nameTxt;
  final String assetImagePath;
  final double startVal;

  FavouriteDriverWidget({
    @required this.nameTxt,
    @required this.assetImagePath,
    @required this.startVal,
    //this.profileImg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 15,
                      top: 15,
                    ),
                    child: Container(
                      height: 62,
                      width: 62,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80 / 2),
                        image: DecorationImage(
                          image: AssetImage(assetImagePath),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      //color: Colors.white,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 55,
                      ),
                      child: Container(
                        height: 28,
                        width: 28,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28 / 2),
                          color: kSettingFavAddAvtarBg,
                        ),
                        child: Center(
                            child: Icon(
                          Icons.favorite,
                          size: 20,
                          color: kPrimaryColor,
                        )),
                      )),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    nameTxt,
                    style: Theme.of(context).textTheme.caption.copyWith(
                          color: kLoginBlack,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  // RatingBar(
                  //   ignoreGestures: true,
                  //   initialRating: startVal,
                  //   direction: Axis.horizontal,
                  //   allowHalfRating: true,
                  //   itemCount: 5,
                  //   itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                  //   itemSize: 21,
                  //   itemBuilder: (context, _) => Icon(
                  //     Icons.star,
                  //     color: kAccentColor,
                  //   ),
                  //   onRatingUpdate: (rating) {
                  //     print(rating);
                  //   },
                  // )
                ],
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            height: 0.5,
            color: kSettingDivider,
          )
        ],
      ),
    );
  }
}

class RoundedChatWidget extends StatelessWidget {
  final Color backgroundColor;
  final String chatImg;
  final double containerHeight;
  final double containerWidth;

  RoundedChatWidget({
    Key key,
    @required this.backgroundColor,
    @required this.chatImg,
    @required this.containerHeight,
    @required this.containerWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: containerHeight,
          width: containerWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(containerHeight / 2),
            color: backgroundColor,
          ),
          child: Center(
            child: Image.asset(
              chatImg,
              height: 20,
              width: 20,
            ),
          ),
        )
      ],
    );
  }
}
