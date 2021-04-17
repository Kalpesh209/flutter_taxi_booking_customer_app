import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/flat_button_widget.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/square_textfield_widget.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/viit_appbar.dart';


import 'bloc/bloc.dart';

class AddApplePayScreen extends StatelessWidget {
  static const String routeName = "addapplepay";

  final PayMethodsModal args;

  AddApplePayScreen({this.args});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddApplePayBloc(),
      child: AddApplePay(
        args.toolbarTitle,
        args.titleMsg,
        args.hintText,
        args.promoteMsg,
      ),
    );
  }
}

class AddApplePay extends StatefulWidget {
  final String toolbarTitle;
  final String titleMsg;
  final String hintText;
  final String promoteMsg;

  AddApplePay(
    this.toolbarTitle,
    this.titleMsg,
    this.hintText,
    this.promoteMsg,
  );

  @override
  _AddApplePayState createState() => _AddApplePayState();
}

class _AddApplePayState extends State<AddApplePay> {
  AddApplePayBloc addApplePayBloc;

  @override
  void initState() {
    super.initState();
    print("AddApplePay init");
    addApplePayBloc = BlocProvider.of<AddApplePayBloc>(context);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("AddApplePay didChangeDependencies");
  }

  @override
  void dispose() {
    super.dispose();
    print("AddApplePay dispose");
    addApplePayBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddApplePayBloc, AddApplePayState>(
      listener: (context, state) {
        print("BlocListener $state");
      },
      child: BlocBuilder<AddApplePayBloc, AddApplePayState>(
        builder: (context, state) {
          print("$state");
          if (state is InitialAddApplePayState) {
            return _buildInitialState();
          }
          /*else if (state is LoadingQuoteState) {
          return buildLoadingState();
        } else if (state is DetailQuoteState) {
          return buildQuoteState(state.quoteDetails, context);
        } else if (state is ErrorState) {
          return buildErrorState(state.errorMsg);
        }*/
          else {
            return _buildInitialState();
          }
        },
      ),
    );
  }

  Widget _buildInitialState() {
    return SafeArea(
      child: Scaffold(
        appBar: ViitAppBar(
          onLeadingPressed: () {
            Navigator.of(context).pop();
          },
          leadingWidget: ViitAppBarIconWidget(
            viitAppBarIconType: ViitAppBarIconTypes.BACK,
          ),
          titleWidget: ViitTitleWidget(widget.toolbarTitle),
        ),
        body: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.titleMsg,
                style: Theme.of(context).textTheme.caption.copyWith(
                      color: kLoginBlack,
                      fontSize: 15,
                    ),
              ),
              SizedBox(
                height: 12,
              ),
              SquareTextFieldWidget(
                onSubmited: (str) {},
                hintText: widget.hintText,
                inputType: TextInputType.emailAddress,
                inputAction: TextInputAction.done,
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: FlatButtonWidget(
                      btnTxt: "Save",
                      btnOnTap: () {},
                      btnColor: kAccentColor,
                      height: 50,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 36,
              ),
              Text(
                widget.promoteMsg,
                style: Theme.of(context).textTheme.caption.copyWith(
                      color: kDottedBorder,
                      fontSize: 15,
                      letterSpacing: 0.6,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PayMethodsModal {
  final String toolbarTitle;
  final String titleMsg;
  final String hintText;
  final String promoteMsg;

  PayMethodsModal({
    this.toolbarTitle,
    this.titleMsg,
    this.hintText,
    this.promoteMsg,
  });
}
