import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';
import 'package:flutter_taxi_booking_customer_app/common/viiticons_icons.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/flat_button_widget.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/square_textfield_widget.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/viit_appbar.dart';


import 'bloc/bloc.dart';

class AddCardScreen extends StatelessWidget {
  static const String routeName = "addcard";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: AddCard(),
      create: (context) => AddCardBloc(),
    );
  }
}

class AddCard extends StatefulWidget {
  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  AddCardBloc addCardBloc;

  @override
  void initState() {
    super.initState();
    print("AddCard() init");
    addCardBloc = BlocProvider.of<AddCardBloc>(context);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("AddCard() didChangeDependencies");
  }

  @override
  void dispose() {
    super.dispose();
    print("AddCard() dispose");
    addCardBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddCardBloc, AddCardState>(listener: (context, state) {
      print("BlocListener $state");
    }, child: BlocBuilder<AddCardBloc, AddCardState>(
      builder: (context, state) {
        print("BlocBuilder $state");

        if (state is InitialAddCardState) {
          return _buildInitialState();
        } else if (state is LoadingAddCardState) {
          return _buildLoadingState();
        } else if (state is ErrorState) {
          return _buildErrorState(state.errorMsg);
        } else {
          return _buildInitialState();
        }
      },
    ));
  }

  _buildInitialState() {
    return SafeArea(
      child: Scaffold(
        appBar: ViitAppBar(
          onLeadingPressed: () {
            Navigator.of(context).pop();
          },
          leadingWidget: ViitAppBarIconWidget(
            viitAppBarIconType: ViitAppBarIconTypes.BACK,
          ),
          titleWidget: ViitTitleWidget("Add Payment Method"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: <Widget>[
              CardNumnerWidget(),
              Padding(
                padding: const EdgeInsets.only(
                  left: 13,
                  right: 13,
                  top: 15,
                ),
                child: SquareTextFieldWidget(
                  hintText: "Full name as appear on the card",
                  inputType: TextInputType.text,
                  inputAction: TextInputAction.done,
                ),
              ),
              Row(
                children: <Widget>[
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 13,
                        right: 13,
                        top: 15,
                      ),
                      child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            color: Color(0XFFF2F2F4),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  hintText: 'MM/YYYY',
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .caption
                                      .copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                      )),
                            ),
                          )),
                    ),
                  ),
                  Flexible(
                      child: Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      right: 15,
                      top: 15,
                    ),
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          color: Color(0XFFF2F2F4),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              children: <Widget>[
                                Flexible(
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        hintText: 'CVV',
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .caption
                                            .copyWith(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15,
                                            )),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Icon(
                                    Icons.info,
                                    color: kLoginBlack,
                                    size: 25.0,
                                  ),
                                )
                              ],
                            ))),
                  )),
                ],
              ),
              SizedBox(
                height: 36,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: FlatButtonWidget(
                          btnColor: kAccentColor,
                          btnTxt: "Done",
                          height: 52,
                          btnOnTap: () {
                            print("Done");
                          }),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 21,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.lock,
                      color: kLoginBlack,
                      size: 24.0,
                    ),
                    Text(
                      "Your payment info is stored securely.",
                      style: Theme.of(context).textTheme.caption.copyWith(
                            fontSize: 15,
                            color: kLoginBlack,
                          ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildLoadingState() {
    return Container();
  }

  _buildErrorState(errorMsg) {
    return Container();
  }
}

class CardNumnerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 15,
          right: 15,
          top: 15,
        ),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            color: Color(0XFFF2F2F4),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                ),
                child: Icon(
                  Viiticons.card,
                  color: kDottedBorder,
                  size: 20.0,
                ),
              ),
              Flexible(
                  child: Padding(
                padding: const EdgeInsets.only(
                  left: 14,
                  right: 10,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: 'Card Number',
                    hintStyle: Theme.of(context).textTheme.caption.copyWith(
                          fontSize: 15,
                        ),
                  ),
                ),
              )),
              Padding(
                padding: const EdgeInsets.only(
                  right: 15,
                ),
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.black,
                  size: 24.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
