import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';
import 'package:flutter_taxi_booking_customer_app/features/loginsignup/login/login_screen.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/onboard_widget.dart';
import 'package:get_it/get_it.dart';


import 'bloc/bloc.dart';

class OnBoardScreen extends StatelessWidget {
  static const String routeName = "onboard";
  final getIt = GetIt.instance;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardBloc(),
      child: OnBoard(),
    );
  }
}

class OnBoard extends StatefulWidget {
  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  OnboardBloc onBoardBloc;
  int currentPageValue;
  var images = ["assets/google.png", "assets/india.png", "assets/facebook.png"];

  @override
  void initState() {
    super.initState();
    print("OnBoard(): init");
    onBoardBloc = BlocProvider.of<OnboardBloc>(context);
    onBoardBloc.add(
      NextEvent(),
    );
    if (Platform.isAndroid) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark, //Android
        ),
      );
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("OnBoard(): didChangeDependencies");
  }

  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<OnboardBloc, OnboardState>(
          listener: (blcontext, state) {
            if (state is GotoLoginOnboardState) {
              Navigator.of(blcontext).pushReplacementNamed(
                LoginScreen.routeName,
              );
            }
          },
          child: BlocBuilder<OnboardBloc, OnboardState>(
            builder: (blocContext, state) {
              print("BlocBuilder: $state");
              if (state is InitialOnboardState) {
                return buildInitialState();
              } else if (state is LoadingOnboardState) {
                return buildLoadingState();
              } else if (state is CurrentOnboardState) {
                return OnboardWidget(
                  onTapImageIndex: state.currentIndex,
                  images: [
                    "assets/onboarding_0.png",
                    "assets/onboarding_1.png",
                    "assets/onboarding_2.png",
                  ],
                  titles: [
                    "Request ride",
                    "Confirm your driver",
                    "Track your ride"
                  ],
                  subtitles: [
                    "Request a ride get picked up by a nearby community driver.",
                    "Huge drivers network helps you find comfortable, safe and cheap ride.",
                    "Know your driver in advance and be able to view current location in real time on the map."
                  ],
                  myOnSkipPressed: () {
                    print("Press Skip");
                    onBoardBloc.add(
                      GoToLoginEvent(),
                    );
                  },
                  myOnNextPressed: () {
                    print("Press Next");
                    onBoardBloc.add(
                      NextEvent(),
                    );
                  },
                );
              } else {
                return Center(
                  child: Text("Unhandled state"),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    print("OnBoard(): dispose");
    if (Platform.isAndroid) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light.copyWith(
          statusBarColor: kPrimaryColor,
          statusBarIconBrightness: Brightness.light,
        ),
      );
    }
  }

  Widget buildInitialState() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildLoadingState() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildErrorState(errorMsg) {
    return Container();
  }
}
