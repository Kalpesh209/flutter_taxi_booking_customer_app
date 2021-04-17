import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';
import 'package:flutter_taxi_booking_customer_app/common/viiticons_icons.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/country_selection_textfield_widget.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/date_picker_widget.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/flat_button_widget.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/password_textfield.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/social_media_widget.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/square_textfield_widget.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/viit_appbar.dart';


import 'bloc/bloc.dart';

class SignupScreen extends StatelessWidget {
  static const String routeName = "signup";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: Signup(),
      create: (context) => SignupBloc(),
    );
  }
}

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  var _isCheckedVittTeen = false;
  var _isCheckedRide = false;
  var _isCheckedTerms = false;
  var selectGender;
  DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    print("Signup() initState");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("Signup() didChangeDependencies");
  }

  @override
  void dispose() {
    super.dispose();
    print("Signup() dispose");
  }

  @override
  Widget build(BuildContext context) {
    print("Signup() build");
    return SafeArea(
      child: Scaffold(
        appBar: ViitAppBar(
          leadingWidget: ViitAppBarIconWidget(
            viitAppBarIconType: ViitAppBarIconTypes.BACK,
          ),
          onLeadingPressed: () {
            Navigator.of(context).pop();
          },
          titleWidget: ViitTitleWidget("Sign Up"),
        ),
        body: BlocBuilder<SignupBloc, SignupState>(
          builder: (context, state) {
            print("$state");
            if (state is InitialSignupState) {
              return buildInitialState();
            } else if (state is LoadingSignupState) {
              return buildLoadingState();
            } else if (state is ErrorState) {
              return buildErrorState(state.errorMsg);
            } else {
              return Center(
                child: Text("Unhandled state"),
              );
            }
          },
        ),
      ),
    );
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  buildInitialState() {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 18,
              ),
              Stack(
                children: <Widget>[
                  Container(
                    height: 128,
                    width: 135,
                  ),
                  DottedBorder(
                    color: kDottedBorder,
                    borderType: BorderType.RRect,
                    radius: Radius.circular(120 / 2),
                    padding: EdgeInsets.all(6),
                    dashPattern: [8, 8],
                    strokeWidth: 1,
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100 / 2),
                      ),
                      child: Center(
                        child: Icon(
                          Viiticons.profile_pic,
                          color: kDottedBorderFab,
                          size: 48,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 15,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40 / 2),
                        color: kDottedBorderFab,
                      ),
                      child: Center(
                        child: Icon(
                          Viiticons.plus,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Opacity(
                opacity: 0.64,
                child: Text(
                  "Upload your photo",
                  style: Theme.of(context).textTheme.caption.copyWith(
                        color: kLoginBlack,
                        fontSize: 16,
                      ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SquareTextFieldWidget(
                hintText: "First Name",
                inputAction: TextInputAction.next,
                inputType: TextInputType.text,
              ),
              SizedBox(
                height: 15,
              ),
              SquareTextFieldWidget(
                hintText: "Last Name",
                inputAction: TextInputAction.next,
                inputType: TextInputType.text,
              ),
              SizedBox(
                height: 15,
              ),
              SquareTextFieldWidget(
                hintText: "Nick Name",
                inputAction: TextInputAction.next,
                inputType: TextInputType.text,
              ),
              SizedBox(
                height: 15,
              ),
              CountrySelectionTextField(
                inputType: TextInputType.number,
                inputAction: TextInputAction.next,
                hintText: "Enter mobile number",
              ),
              SizedBox(
                height: 15,
              ),
              SquareTextFieldWidget(
                hintText: "Email Address",
                inputType: TextInputType.emailAddress,
                inputAction: TextInputAction.next,
              ),
              SizedBox(
                height: 15,
              ),
              DatePickerContainer(
                selectDate: () => _selectDate(context),
                date: selectedDate == null
                    ? "Date of Brith"
                    : "${selectedDate.year.toString()}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}",
                icon: Viiticons.calendar,
              ),
              SizedBox(
                height: 15,
              ),
              PasswordFormField(
                hintText: "Password",
              ),
              SizedBox(
                height: 15,
              ),
              PasswordFormField(
                hintText: "Confirm password",
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Opacity(
                    opacity: 0.64,
                    child: Text(
                      "Are You Interested in Child Ride ?",
                      style: Theme.of(context).textTheme.caption.copyWith(
                            color: kLoginBlack,
                            fontSize: 17,
                          ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Radio(
                    value: 1,
                    activeColor: kPrimaryColor,
                    groupValue: selectGender,
                    onChanged: (val) {
                      setState(() {
                        selectGender = val;
                      });
                    },
                  ),
                  Text(
                    "Yes",
                    style: Theme.of(context).textTheme.caption.copyWith(
                          color: kTextLoginfaceid,
                          fontSize: 17,
                        ),
                  ),
                  Radio(
                    value: 2,
                    activeColor: kPrimaryColor,
                    groupValue: selectGender,
                    onChanged: (val) {
                      setState(() {
                        selectGender = val;
                      });
                    },
                  ),
                  Text(
                    "No",
                    style: Theme.of(context).textTheme.caption.copyWith(
                          color: Colors.grey,
                          fontSize: 17,
                        ),
                  ),
                ],
              ),
              SizedBox(
                height: 6,
              ),
              Row(
                children: <Widget>[
                  Checkbox(
                    value: _isCheckedTerms,
                    activeColor: Colors.grey,
                    onChanged: (bool value) {
                      print(value);
                      setState(() {
                        _isCheckedTerms = value;
                      });
                    },
                    checkColor: Color(0xFFFFFFFF),
                    tristate: false,
                  ),
                  Container(
                    width: 250,
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          height: 1.2,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'I agree with ',
                            style: Theme.of(context).textTheme.caption.copyWith(
                                  fontSize: 16,
                                ),
                          ),
                          TextSpan(
                            text: 'Terms of Condition ',
                            style: Theme.of(context).textTheme.caption.copyWith(
                                  fontSize: 16,
                                  color: kPrimaryColor,
                                ),
                          ),
                          TextSpan(
                              text: 'as well as ',
                              style:
                                  Theme.of(context).textTheme.caption.copyWith(
                                        fontSize: 16,
                                      )),
                          TextSpan(
                            text: 'Privacy Policy.',
                            style: Theme.of(context).textTheme.caption.copyWith(
                                  fontSize: 16,
                                  color: kPrimaryColor,
                                ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 24,
                        right: 24,
                      ),
                      child: FlatButtonWidget(
                        btnOnTap: () {},
                        btnTxt: "Sign Up",
                        btnColor: kAccentColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 21,
              ),
              Center(
                child: Text(
                  "Or connect with social",
                  style: Theme.of(context).textTheme.subhead.copyWith(
                        color: kTextLoginfaceid,
                        fontSize: 16,
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
                height: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }

  buildLoadingState() {
    return Container();
  }

  buildErrorState(errorMsg) {
    return Center(
      child: Icon(Icons.sync_problem),
    );
  }
}
