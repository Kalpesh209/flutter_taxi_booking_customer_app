import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';
import 'package:flutter_taxi_booking_customer_app/common/viiticons_icons.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/fab_button.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/password_textfield.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/wavy_header_widget.dart';


import 'bloc/bloc.dart';

class ResetPassScreen extends StatelessWidget {
  static const String routeName = "resetpass";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: ResetPass(),
      create: (context) => ResetPassBloc(),
    );
  }
}

class ResetPass extends StatefulWidget {
  @override
  _ResetPassState createState() => _ResetPassState();
}

class _ResetPassState extends State<ResetPass> {
  ResetPassBloc reserPassBloc;

  @override
  void initState() {
    super.initState();
    print("ResetPass() init");
    reserPassBloc = BlocProvider.of<ResetPassBloc>(context);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("ResetPass() didChangeDependencies");
  }

  @override
  void dispose() {
    super.dispose();
    print("ResetPass() dispose");
    reserPassBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocListener<ResetPassBloc, ResetPassState>(
          listener: (context, state) {},
          child: BlocBuilder<ResetPassBloc, ResetPassState>(
            builder: (context, state) {
              print("$state");
              if (state is InitialResetPassState) {
                return _buildInitialState();
              } else if (state is LoadingResetPassState) {
                return _buildLoadingState();
              } else if (state is ErrorState) {
                return _buildErrorState(state.errorMsg);
              } else {
                return _buildInitialState();
              }
            },
          ),
        ),
      ),
    );
  }

  _buildLoadingState() {
    return Container();
  }

  _buildErrorState(errorMsg) {
    return Center(
      child: Icon(Icons.sync_problem),
    );
  }

  _buildInitialState() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          WavyHeader(
            isBack: true,
            onBackTap: () {
              Navigator.of(context).pop();
            },
          ),
          SizedBox(
            height: 42,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 46, right: 46),
            child: Text(
              "Reset Password",
              style: Theme.of(context).textTheme.headline.copyWith(
                    color: kLoginBlack,
                    fontSize: 20,
                  ),
            ),
          ),
          SizedBox(
            height: 21,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 46, right: 46),
            child: PasswordFormField(
              hintText: "Enter New Password",
            ),
          ),
          SizedBox(
            height: 21,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 46, right: 46),
            child: PasswordFormField(
              hintText: "Confirm Password",
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 46, right: 46),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FABButton(
                  bgColor: kAccentColor,
                  icon: Icon(
                    Viiticons.next_arrow,
                    color: Colors.white,
                    size: 18,
                  ),
                  onTap: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
