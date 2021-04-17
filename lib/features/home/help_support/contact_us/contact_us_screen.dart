import 'package:flutter/material.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/flat_button_widget.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/multiline_textfield_widget.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/viit_appbar.dart';

class ContactUsScreen extends StatelessWidget {
  static const String routeName = "contactusscreen";

  @override
  Widget build(BuildContext context) {
    return ContactUs();
  }
}

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
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
          titleWidget: ViitTitleWidget("Contact Us"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  "Need Help?",
                  style: Theme.of(context).textTheme.caption.copyWith(
                        color: kLoginBlack,
                        fontSize: 18,
                      ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Our customer care team will be in touch with you within 12 hours.",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption.copyWith(
                        color: kTextLoginfaceid,
                        fontSize: 15,
                      ),
                ),
                SizedBox(
                  height: 16,
                ),
                MultilineTextField(hintText: "Type your issue here"),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8,),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: FlatButtonWidget(
                          btnTxt: "Send",
                          btnOnTap: () {},
                          btnColor: kAccentColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Instant Contact",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.mail,
                      size: 20,
                      color: kTextLoginfaceid,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      "viit.info@viit.com",
                      style: Theme.of(context).textTheme.caption.copyWith(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 45,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    border: Border.all(
                      color: Color(0xff8C8C8F),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.phone,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "401-091-5588",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
