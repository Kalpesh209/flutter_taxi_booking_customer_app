import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';
import 'package:flutter_taxi_booking_customer_app/common/viiticons_icons.dart';
import 'package:flutter_taxi_booking_customer_app/features/loginsignup/reset_password/reset/reset_screen.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/fab_button.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/pin_entry_text_fild_widget.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/wavy_header_widget.dart';


import 'bloc/bloc.dart';

class OTPScreen extends StatelessWidget {
  static const String routeName = "otp";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: OTP(),
      create: (context) => OptBloc(),
    );
  }
}

class OTP extends StatefulWidget {
  @override
  _OTPState createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  OptBloc otpBloc;

  @override
  void initState() {
    super.initState();
    print("OTP() init");
    otpBloc = BlocProvider.of<OptBloc>(context);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("OTP() didChangeDependencies");
  }

  @override
  void dispose() {
    super.dispose();
    print("OTP() dispose");
    otpBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocListener<OptBloc, OptState>(
          listener: (context, state) {
            if (state is GotoResetPassState) {
              Navigator.of(context).pushNamed(ResetPassScreen.routeName);
            }
          },
          child: BlocBuilder<OptBloc, OptState>(
            builder: (context, state) {
              print("$state");
              if (state is InitialOptState) {
                return _buildInitialState();
              } else if (state is LoadingOptState) {
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
              "OTP Verification",
              style: Theme.of(context).textTheme.headline.copyWith(
                    color: kLoginBlack,
                    fontSize: 20,
                  ),
            ),
          ),
          SizedBox(
            height: 21,
          ),
          PinEntryTextField(
            fields: 4,
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
                    otpBloc.add(
                      VerifyOTPEvent(),
                    );
                  },
                )
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 46, right: 46),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "I didn’t receive a code!",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subhead.copyWith(
                        color: kTextLoginfaceid,
                        fontSize: 15,
                      ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 46, right: 46),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Resend",
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
