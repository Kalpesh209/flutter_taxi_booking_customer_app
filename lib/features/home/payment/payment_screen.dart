import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';
import 'package:flutter_taxi_booking_customer_app/common/viiticons_icons.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/payment/add_payment_method/add_business_profile/add_business_profile_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/payment/add_payment_method/add_payment_method_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/payment/add_payment_method/ride_personal_profile/ride_personal_profile_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/payment/apple_pay/apple_pay_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/payment/cash/cash_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/payment/credit_card/credit_card_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/payment/gpay/g_pay_screen.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/pay_widget.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/ride_profile_widget.dart';


import 'bloc/bloc.dart';

class PaymentScreen extends StatelessWidget {
  static const String routeName = "payment";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: Payment(),
      create: (context) => PaymentBloc(),
    );
  }
}

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 25,
              ),
              Text(
                "Payment Methods",
                style: Theme.of(context).textTheme.caption.copyWith(
                      fontWeight: FontWeight.w500,
                      color: kLoginBlack,
                      fontSize: 20,
                    ),
              ),
              SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    CashScreen.routeName,
                  );
                },
                child: Row(
                  children: <Widget>[
                    Icon(
                      Viiticons.cash,
                      size: 24,
                      color: kTextLoginfaceid,
                    ),
                    SizedBox(
                      width: 18,
                    ),
                    Text(
                      "Cash",
                      style: Theme.of(context).textTheme.caption.copyWith(
                            color: kTextLoginfaceid,
                            fontSize: 18,
                          ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 0.5,
                width: MediaQuery.of(context).size.width,
                color: kGrey,
              ),
              SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(CreditCardScreen.routeName);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Credit Card",
                      style: Theme.of(context).textTheme.caption.copyWith(
                            color: kLoginBlack,
                            fontSize: 16,
                          ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Icon(
                      Viiticons.visa_card,
                      size: 24,
                      color: kTextLoginfaceid,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "**** **** **** 5967",
                          style: Theme.of(context).textTheme.caption.copyWith(
                                color: kTextLoginfaceid,
                                fontSize: 14,
                                letterSpacing: 1.1,
                              ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 0.5,
                      width: MediaQuery.of(context).size.width,
                      color: kGrey,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          GPayScreen.routeName,
                        );
                      },
                      child: PayWidget(
                        payLogo: "assets/google.png",
                        payName: "Google Pay",
                        email: "melissa.brunt69@gmail.com",
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 0.5,
                      width: MediaQuery.of(context).size.width,
                      color: kGrey,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          ApplePayScreen.routeName,
                        );
                      },
                      child: PayWidget(
                        payLogo: "assets/apple.png",
                        payName: "Apple Pay",
                        email: "melissa.brunt69@gmail.com",
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 0.5,
                      width: MediaQuery.of(context).size.width,
                      color: kGrey,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          AddPaymentMethodScreen.routeName,
                        );
                      },
                      child: Text(
                        "Add Payment Method",
                        style: Theme.of(context).textTheme.caption.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Color(0XFF275687),
                            fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Ride Profile",
                      style: Theme.of(context).textTheme.caption.copyWith(
                            color: kLoginBlack,
                            fontSize: 20,
                          ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            children: <Widget>[
              RideProfileWidget(
                myLogo: Icon(
                  Icons.person,
                  size: 24,
                  color: Colors.white,
                ),
                myTitlel: "Personal",
                myColor: Color(0XFF275687),
                myOnTap: () {
                  Navigator.of(context).pushNamed(
                    RidePersonalProfileScreen.routeName,
                  );
                },
              ),
              SizedBox(
                height: 12,
              ),
              RideProfileWidget(
                myLogo: Icon(
                  Viiticons.work,
                  size: 16,
                  color: Colors.white,
                ),
                myTitlel: "Add Business Profile",
                myColor: Color(0XFFF7AA01),
                myOnTap: () {
                  Navigator.of(context).pushNamed(
                    AddBusinessProfileScreen.routeName,
                  );
                },
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        )
      ],
    );
  }
}
