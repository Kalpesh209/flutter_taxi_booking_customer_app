import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/help_support/contact_us/contact_us_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/help_support/feedback/feedback_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/help_support/help_support_questions/help_support_questions_screen.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/flat_button_widget.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/my_listtile_widget.dart';


import 'bloc/bloc.dart';

class HelpSupportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: HelpSupport(),
      create: (context) => HelpSupportBloc(),
    );
  }
}

class HelpSupport extends StatefulWidget {
  @override
  _HelpSupportState createState() => _HelpSupportState();
}

class _HelpSupportState extends State<HelpSupport> {
  List<String> title = [
    "Popular Questions",
    "Payment Methods",
    "Cancelling and booking",
    "Coupons and credits"
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 12,
        bottom: 12,
        left: 8,
        right: 8,
      ),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: ListView.builder(
              itemCount: title.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyListTitle(
                  title: title[index],
                  myOnTap: () {
                    Navigator.of(context).pushNamed(
                      HelpSupportQuestionsScreen.routeName,
                    );
                  },
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: FlatButtonWidget(
                      btnTxt: "Contact Us",
                      btnColor: kAccentColor,
                      btnOnTap: () {
                        Navigator.of(context).pushNamed(
                          ContactUsScreen.routeName,
                        );
                      },
                    ),
                    flex: 1,
                  ),
                  SizedBox(
                    width: 32,
                  ),
                  Expanded(
                    child: FlatButtonWidget(
                      btnTxt: "Feedback",
                      btnColor: kPrimaryColor,
                      btnOnTap: () {
                        Navigator.of(context).pushNamed(
                          FeedBackScreen.routeName,
                        );
                      },
                    ),
                    flex: 1,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
