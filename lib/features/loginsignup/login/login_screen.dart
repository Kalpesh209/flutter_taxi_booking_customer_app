import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';
import 'package:flutter_taxi_booking_customer_app/common/viiticons_icons.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/home_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/loginsignup/login_faceid/login_faceid_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/loginsignup/reset_password/forgot/forgot_password_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/loginsignup/signup/signup_screen.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/country_selection_textfield_widget.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/fab_button.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/password_textfield.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/social_media_widget.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/wavy_header_widget.dart';


import 'bloc/bloc.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "login";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(),
      child: Login(),
    );
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginBloc loginBloc;
  TextEditingController _mobileCntrl = TextEditingController();
  TextEditingController _passCntrl = TextEditingController();
  FocusNode _mobileNode = FocusNode();
  FocusNode _passwordNode = FocusNode();

  @override
  void initState() {
    super.initState();
    print("Login(): init");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("Login(): didChangeDependencies");
    loginBloc = BlocProvider.of<LoginBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    print("Login(): build");

    return SafeArea(
      child: Scaffold(
        body: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            print("bloclistner(): $state");

            if (state is GotoHomeState) {
              Navigator.of(context).pushReplacementNamed(
                HomeScreen.routeName,
              );
            } else if (state is FacenotRecognizedLoginState) {
              // showDialog(
              //   context: context,
              //   child: DialogBoxWidget(
              //     isIconShow: true,
              //     titleText: "Face Not Recognized",
              //     descriptionText: "Try Again",
              //     secondaryBtnTxt: "Cancel",
              //     primaryBtnTxt: "Try FaceID again",
              //     onPrimaryTap: () {
              //       Navigator.of(context).pop();
              //     },
              //     onSecondaryTap: () {
              //       Navigator.of(context).pop();
              //     },
              //   ),
              // );
            } else if (state is GotoFaceIDLoginState) {
              Navigator.of(context).pushNamed(
                LoginFaceIDScreen.routeName,
              );
            } else if (state is GotoForgotPassState) {
              Navigator.of(context).pushNamed(
                ForgotPasswordScreen.routeName,
              );
            }
          },
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              print("blocbuilder(): $state");
              if (state is InitialLoginState) {
                return _buildInitiateState(context);
              } else if (state is LoadingLoginState) {
                return _buildLoadingState();
              } else if (state is ErrorLoginState) {
                return _buildErrorState("Something went wrong");
              } else {
                return _buildInitiateState(context);
              }
            },
          ),
        ),
      ),
    );
  }

  _buildInitiateState(paramContext) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          WavyHeader(),
          Padding(
            padding: const EdgeInsets.only(left: 46, right: 46),
            child: Text(
              "Sign In",
              style: Theme.of(context).textTheme.headline.copyWith(
                    color: kLoginBlack,
                    fontSize: 20,
                  ),
            ),
          ),
          SizedBox(
            height: 18,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 46, right: 46),
            child: CountrySelectionTextField(
              myController: _mobileCntrl,
              myFocusNode: _mobileNode,
              hintText: "Enter mobile number",
              inputAction: TextInputAction.next,
              inputType: TextInputType.number,
              onSubmited: (str) {
                _fieldFocusChange(context, _mobileNode, _passwordNode);
              },
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 46, right: 46),
            child: PasswordFormField(
              myFocusNode: _passwordNode,
              myController: _passCntrl,
              hintText: "Password",
              inputAction: TextInputAction.done,
              onSubmited: (str) {
                if (_passwordNode.hasFocus) {
                  _passwordNode.unfocus();
                }
              },
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 46, right: 46),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    top: 4,
                    left: 8,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        ForgotPasswordScreen.routeName,
                      );
                      /*loginBloc.add(
                        ForgotPassEvent(),
                      );*/
                    },
                    child: Text(
                      "Forgot Password?",
                      style: Theme.of(context).textTheme.caption.copyWith(
                            color: kLoginBlack,
                            fontSize: 15,
                          ),
                    ),
                  ),
                ),
                FABButton(
                  bgColor: kAccentColor,
                  onTap: () {
                    if (_mobileCntrl.text.toString() != "") {
                      if (_passCntrl.text.toString() != "") {
                        FocusScope.of(context).unfocus();
                        loginBloc.add(
                          SubmitLoginEvent("", ""),
                        );
                      } else {
                        Scaffold.of(paramContext).showSnackBar(
                          SnackBar(
                            content: Text("Please type password..."),
                          ),
                        );
                      }
                    } else {
                      Scaffold.of(paramContext).showSnackBar(
                        SnackBar(
                          content: Text("Pleas type mobile no..."),
                        ),
                      );
                    }
                  },
                  icon: Icon(
                    Viiticons.next_arrow,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 18,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                loginBloc.add(
                  LoginWithFaceidEvent(),
                );
              },
              child: Text(
                "Login with Face ID",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.caption.copyWith(
                      color: kAccentColor,
                      fontSize: 16,
                      letterSpacing: 0.38,
                    ),
              ),
            ),
          ),
          SizedBox(
            height: 74,
          ),
          Center(
            child: Text(
              "Or connect with social",
              style: Theme.of(context).textTheme.caption.copyWith(
                    color: kLoginBlack,
                    fontSize: 16,
                    letterSpacing: 0.28,
                  ),
            ),
          ),
          SizedBox(
            height: 21,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SocialMediaWidget(
                assetPath: "assets/facebook.png",
                bgColor: kSocialBg,
              ),
              SizedBox(
                width: 6,
              ),
              SocialMediaWidget(
                assetPath: "assets/google.png",
                bgColor: kSocialBg,
              ),
              SizedBox(
                width: 6,
              ),
              SocialMediaWidget(
                assetPath: "assets/linkedin.png",
                bgColor: kSocialBg,
              ),
            ],
          ),
          SizedBox(
            height: 21,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(SignupScreen.routeName);
              },
              child: RichText(
                text: TextSpan(children: [
                  /*Theme.of(context).textTheme.subhead.copyWith(
                      color: kLoginBlack,*/
                  TextSpan(
                    text: "Don't have an account? ",
                    style: Theme.of(context).textTheme.subhead.copyWith(
                          color: kLoginBlack,
                          fontSize: 17,
                          letterSpacing: 0.18,
                        ),
                  ),
                  TextSpan(
                    text: "Sign Up",
                    style: Theme.of(context).textTheme.subhead.copyWith(
                          color: kAccentColor,
                          fontSize: 18,
                        ),
                  ),
                ]),
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    //Cursor dispose
    _mobileNode.dispose();
    _passwordNode.dispose();

    //Controller dispose
    _mobileCntrl.dispose();
    _passCntrl.dispose();

    //Bloc dispose
    loginBloc.close();
    super.dispose();
  }

  _buildLoadingState() {
    return Container();
  }

  _buildErrorState(errorMsg) {
    return Center(
      child: Icon(Icons.sync_problem),
    );
  }

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
