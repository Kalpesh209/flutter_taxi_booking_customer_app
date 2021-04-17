import 'package:flutter/material.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/viit_appbar.dart';


class HelpSupportQuestionAnswerScreen extends StatelessWidget {
  static const String routeName = "helpsupportquestionanswer";

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
          titleWidget: ViitTitleWidget("Help & Support"),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            top: 18,
            bottom: 18,
            left: 32,
            right: 21,
          ),
          child: Column(
            children: <Widget>[
              Text(
                "What methods of payment does Vitt accept?",
                style: Theme.of(context).textTheme.caption.copyWith(
                      color: kLoginBlack,
                      fontSize: 18,
                    ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "$kLoremText $kLoremText $kLoremText $kLoremText $kLoremText",
                style: Theme.of(context).textTheme.caption.copyWith(
                      color: kTextLoginfaceid,
                      fontSize: 16,
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
