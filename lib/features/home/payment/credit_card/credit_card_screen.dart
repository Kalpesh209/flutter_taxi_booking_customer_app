import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/credit_card_widget.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/viit_appbar.dart';

import 'bloc/bloc.dart';

class CreditCardScreen extends StatelessWidget {
  static const String routeName = "creditcard";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: CreditCard(),
      create: (context) => CreditCardBloc(),
    );
  }
}

class CreditCard extends StatefulWidget {
  @override
  _CreditCardState createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  CreditCardBloc creditCardBloc;

  @override
  void initState() {
    super.initState();
    print("CreditCard() init");
    creditCardBloc = BlocProvider.of<CreditCardBloc>(context);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("CreditCard() didChangeDependencies");
  }

  @override
  void dispose() {
    super.dispose();
    print("CreditCard() dispose");
    creditCardBloc.close();
  }

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
          titleWidget: ViitTitleWidget("Credit Card"),
        ),
        body: BlocListener<CreditCardBloc, CreditCardState>(
          listener: (BuildContext context, state) {
            if (state is ShowDeleteCardState) {
              // showDialog(
              //   context: context,
              //   child: DialogBoxWidget(
              //     titleText:
              //         "Are you sure you want to delete this payment method?",
              //     secondaryBtnTxt: "Cancel",
              //     primaryBtnTxt: "Delete",
              //     descriptionText: "",
              //     isIconShow: false,
              //     onPrimaryTap: () {},
              //     onSecondaryTap: () {},
              //     myOnCloseTap: () {
              //       Navigator.of(context).pop();
              //     },
              //   ),
              // );
            }
          },
          child: BlocBuilder<CreditCardBloc, CreditCardState>(
            builder: (context, state) {
              print("$state");
              if (state is InitialCreditCardState) {
                return _buildInitialState(context);
              } /*else if (state is LoadingCreditCardState) {
                return _buildLoadingState();
              }*/ else if (state is ErrorState) {
                return _buildErrorState(state.errorMsg);
              } else {
                return _buildInitialState(context);
              }
            },
          ),
        ),
      ),
    );
  }

  _buildInitialState(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          CreditCardWidget(
            cardType: "Credit Card",
            cardNumber: "**** **** **** 5967",
            cardExpireDate: "07/2022",
            myOnDeleteTap: () {
              print("Open delete dialog");
              creditCardBloc.add(
                ClickOnDeleteEvent(),
              );
            },
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Add New Card",
            style: Theme.of(context).textTheme.caption.copyWith(
                  fontWeight: FontWeight.w500,
                  color: kPrimaryColor,
                  fontSize: 16,
                ),
          ),
        ],
      ),
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
