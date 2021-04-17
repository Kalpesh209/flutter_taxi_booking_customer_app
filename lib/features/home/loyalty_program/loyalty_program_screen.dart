import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/loyalty_program/loyalty_program_details_screen.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/border_button_widget.dart';


import 'bloc/bloc.dart';

class LoyaltyProgramScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: LoyaltyProgram(),
      create: (context) => LoyaltyProgramBloc(),
    );
  }
}

class LoyaltyProgram extends StatefulWidget {
  @override
  _LoyaltyProgramState createState() => _LoyaltyProgramState();
}

class _LoyaltyProgramState extends State<LoyaltyProgram> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 26,
        ),
        Center(
          child: Image.asset(
            "assets/loyalty.png",
            height: 240,
            width: 240,
          ),
        ),
        /*SizedBox(
          height: 0,
        ),
        Text(
          "-40%",
          style: Theme.of(context).textTheme.caption.copyWith(
                fontSize: 28,
                color: kLoginBlack,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.3,
              ),
        ),*/
        SizedBox(
          height: 46,
        ),
        BorderButtonWidget(
          text: "How the Loyalty Program works",
          myOnTap: () {
            Navigator.of(context)
                .pushNamed(LoyaltyProgramDetailsScreen.routeName);
          },
        ),
      ],
    );
  }
}
