import 'package:flutter/material.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/flat_button_widget.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/multiline_textfield_widget.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/viit_appbar.dart';


class FeedBackScreen extends StatelessWidget {
  static const String routeName = "feedbackscreen";

  @override
  Widget build(BuildContext context) {
    return FeedBack();
  }
}

class FeedBack extends StatefulWidget {
  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
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
          titleWidget: ViitTitleWidget("Feedback"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  "We are listening!",
                  style: Theme.of(context).textTheme.caption.copyWith(
                        color: kLoginBlack,
                        fontSize: 18,
                      ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Your opinion is very important to us. Please a moment to share your valued feedback.",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption.copyWith(
                        color: kTextLoginfaceid,
                        fontSize: 15,
                      ),
                ),
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child:
                      MultilineTextField(hintText: "Type your feedback here"),
                ),
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8,
                    right: 8,
                  ),
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
              ],
            )
          ]),
        ),
      ),
    );
  }
}
