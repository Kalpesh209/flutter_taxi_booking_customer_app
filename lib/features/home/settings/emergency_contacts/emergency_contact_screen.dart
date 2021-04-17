import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';
import 'package:flutter_taxi_booking_customer_app/common/viiticons_icons.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/flat_button_widget.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/viit_appbar.dart';


class EmergencyContactScreen extends StatefulWidget {
  static const String routeName = "emergencycontact";

  @override
  _EmergencyContactScreenState createState() => _EmergencyContactScreenState();
}

class _EmergencyContactScreenState extends State<EmergencyContactScreen> {
  bool isContactAdded = false;
  List<String> contactNames = ["Gail Watkins", "Chad Sims"];
  List<String> contactMobiles = ["+33 0284716623", "+33 0205187161"];

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
          titleWidget: ViitTitleWidget("Emergency Contacts"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 32,
              ),
              Icon(
                Viiticons.vitt_assistance,
                size: 120,
                color: Colors.red,
              ),
              SizedBox(
                height: 21,
              ),
              Text(
                "In case you have emergency during your trip , you can call on SOS button and saved contact will be called.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.caption.copyWith(
                      color: kTextLoginfaceid,
                      fontSize: 16,
                    ),
              ),
              SizedBox(
                height: 21,
              ),
              isContactAdded
                  ? Container(
                      height: 180,
                      child: ListView.builder(
                        itemCount: 2,
                        itemBuilder: (context, index) => ContactsWidget(
                          nameTxt: contactNames[index],
                          mobileTxt: contactMobiles[index],
                        ),
                      ),
                    )
                  : SizedBox(),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: FlatButtonWidget(
                      btnTxt: "Choose Contact",
                      btnColor: kAccentColor,
                      btnOnTap: () {
                        print("Choose contact");
                        setState(
                          () {
                            isContactAdded = true;
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactsWidget extends StatelessWidget {
  final String nameTxt;

  //final String profileimg;
  final String mobileTxt;

  ContactsWidget({
    @required this.nameTxt,
    //this.profileimg,
    @required this.mobileTxt,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60 / 2),
                  image: DecorationImage(
                    image: AssetImage('assets/male_avtar.png'),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    nameTxt,
                    style: Theme.of(context).textTheme.caption.copyWith(
                          color: kLoginBlack,
                          fontSize: 16,
                        ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    mobileTxt,
                    style: Theme.of(context).textTheme.caption.copyWith(
                          color: kTextLoginfaceid,
                          fontSize: 14,
                        ),
                  )
                ],
              ),
            ],
          ),
          Icon(
            CupertinoIcons.delete,
            color: Colors.grey,
            size: 25,
          ),
        ],
      ),
    );
  }
}
