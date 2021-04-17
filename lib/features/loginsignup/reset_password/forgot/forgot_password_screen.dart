import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';
import 'package:flutter_taxi_booking_customer_app/common/viiticons_icons.dart';
import 'package:flutter_taxi_booking_customer_app/features/loginsignup/reset_password/otp/otp_screen.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/country_selection_textfield_widget.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/fab_button.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/wavy_header_widget.dart';


import 'bloc/bloc.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const String routeName = "forgotpassword";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: Forgot(),
      create: (context) => ForgotPasswordBloc(),
    );
  }
}

class Forgot extends StatefulWidget {
  @override
  _ForgotState createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  ForgotPasswordBloc forgotPasswordBloc;

  @override
  void initState() {
    super.initState();
    print("Forgot() init");
    forgotPasswordBloc = BlocProvider.of<ForgotPasswordBloc>(context);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("Forgot() didChangeDependencies");
  }

  @override
  void dispose() {
    super.dispose();
    print("Forgot() dispose");
    forgotPasswordBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
          listener: (context, state) {
            if (state is GotoOTPSendState) {
              Navigator.of(context).pushNamed(OTPScreen.routeName);
            }
          },
          child: BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
            builder: (context, state) {
              print("$state");
              if (state is InitialForgotPasswordState) {
                return _buildInitialState();
              } else if (state is LoadingForgotState) {
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
              "Forgot Password",
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
            child: CountrySelectionTextField(
              hintText: "Enter mobile number",
            ),
          ),
          SizedBox(
            height: 12,
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
                    forgotPasswordBloc.add(
                      SendOTPEvent(""),
                    );
                  },
                )
              ],
            ),
          ),
          SizedBox(
            height: 64,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 46, right: 46),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Back to Sign In",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subhead.copyWith(
                        color: kAccentColor,
                        fontSize: 16,
                      ),
                ),
              ),
            ),
          ),
        ],
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
}
