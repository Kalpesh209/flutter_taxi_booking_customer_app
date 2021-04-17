import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/help_support/help_support_questions/bloc/help_support_questions_bloc.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/help_support/help_support_questions/help_support_questions_ans_screen.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/my_listtile_widget.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/viit_appbar.dart';


class HelpSupportQuestionsScreen extends StatelessWidget {
  static const String routeName = "helpsupportquestions";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: HelpSupportQuestions(),
      create: (context) => HelpSupportQuestionsBloc(),
    );
  }
}

class HelpSupportQuestions extends StatefulWidget {
  @override
  _HelpSupportQuestionsState createState() => _HelpSupportQuestionsState();
}

class _HelpSupportQuestionsState extends State<HelpSupportQuestions> {
  List<String> title = [
    "What methods of payment does Vitt accept?",
    "How i cancel ride?",
    "Can you ride outside of the zone?",
    "Can i modify my ride?",
    "What it the minimum trip required?",
    "How can i modify general settings like language?",
    "It is possible to create a corporate account for businesses?",
    "How can i become a driver?"
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
          titleWidget: ViitTitleWidget("Help & Support"),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            top: 12,
            bottom: 12,
            left: 8,
            right: 8,
          ),
          child: ListView.builder(
            itemCount: title.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: MyListTitle(
                title: title[index],
                myOnTap: () {
                  Navigator.of(context)
                      .pushNamed(HelpSupportQuestionAnswerScreen.routeName);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
