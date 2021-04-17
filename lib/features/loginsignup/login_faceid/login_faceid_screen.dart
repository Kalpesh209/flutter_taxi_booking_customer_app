import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';
import 'package:flutter_taxi_booking_customer_app/common/viiticons_icons.dart';
import 'package:flutter_taxi_booking_customer_app/features/loginsignup/login_faceid/bloc/login_faceid_bloc.dart';
import 'package:flutter_taxi_booking_customer_app/features/loginsignup/login_faceid/bloc/login_faceid_event.dart';
import 'package:flutter_taxi_booking_customer_app/features/loginsignup/login_faceid/bloc/login_faceid_state.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/flat_button_widget.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/viit_appbar.dart';


class LoginFaceIDScreen extends StatelessWidget {
  static const String routeName = "loginfaceid";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: LoginFaceID(),
      create: (context) => LoginFaceidBloc(),
    );
  }
}

class LoginFaceID extends StatefulWidget {
  @override
  _LoginFaceIDState createState() => _LoginFaceIDState();
}

class _LoginFaceIDState extends State<LoginFaceID> {
  LoginFaceidBloc loginFaceidBloc;

  @override
  void initState() {
    super.initState();
    loginFaceidBloc = BlocProvider.of<LoginFaceidBloc>(context);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
    loginFaceidBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: ViitAppBar(
          leadingWidget: ViitAppBarIconWidget(
            viitAppBarIconType: ViitAppBarIconTypes.BACK,
          ),
          onLeadingPressed: () {
            Navigator.of(context).pop();
          },
          titleWidget: ViitTitleWidget("Login to FaceID"),
        ),
        body: BlocListener<LoginFaceidBloc, LoginFaceidState>(
          listener: (BuildContext context, state) {
            if (state is LoadingInfoLoginFaceidState) {
              // showDialog(
              //   context: context,
              //   child: DialogLoadingWidget(
              //     titleText: "Loading your info...",
              //   ),
              // );
            } else if (state is AllowFaceidLoginFaceidState) {
              Navigator.of(context).pop();
              // showDialog(
              //   context: context,
              //   child: DialogBoxWidget(
              //     titleText: "Do you want to allow “Vitt” to use Face ID?",
              //     descriptionText:
              //         "This lets you use Face ID to log in to the app.",
              //     primaryBtnTxt: "OK",
              //     secondaryBtnTxt: "Don’t Allow",
              //     onPrimaryTap: () {},
              //     onSecondaryTap: () {
              //       Navigator.of(context).pop();
              //     },
              //   ),
              // );
            }
          },
          child: BlocBuilder<LoginFaceidBloc, LoginFaceidState>(
            builder: (context, state) {
              print("$state");
              if (state is InitialLoginFaceidState) {
                return _buildInitialState();
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
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 32,
            ),
            child: Text(
              "Allow sign in with Face ID?",
              style: Theme.of(context).textTheme.title.copyWith(
                    color: kLoginBlack,
                    letterSpacing: 0.47,
                    fontSize: 20,
                  ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Icon(
                  Viiticons.face,
                  size: 92,
                  color: kTextLoginfaceid,
                ),
                SizedBox(
                  height: 48,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 52,
                    right: 52,
                  ),
                  child: FlatButtonWidget(
                    btnColor: kAccentColor,
                    btnTxt: "Use Face ID",
                    btnOnTap: () {
                      loginFaceidBloc.add(
                        UserFaceidEvent(),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 21,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Center(
                    child: Text(
                      "Maybe later",
                      style: Theme.of(context).textTheme.button.copyWith(
                            color: kAccentColor,
                            fontSize: 16,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 32,
              right: 32,
              bottom: 24,
            ),
            child: Text(
              "We will require face recognition after 2 minutes of inactivity. You can change the frequency in app settings.",
              style: Theme.of(context).textTheme.body2.copyWith(
                    color: kTextLoginfaceid,
                    fontSize: 15,
                    letterSpacing: 0.17,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  _buildLoadingState() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  _buildErrorState(errorMsg) {
    return Center(
      child: Icon(Icons.sync_problem),
    );
  }
}
