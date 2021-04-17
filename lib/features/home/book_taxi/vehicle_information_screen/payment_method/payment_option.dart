import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';
import 'package:flutter_taxi_booking_customer_app/common/viiticons_icons.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/payment/add_payment_method/add_payment_method_screen.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/flat_button_widget.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/viit_appbar.dart';


class PaymentOptionScreen extends StatelessWidget {
  static const String routeName = "paymentoption";

  @override
  Widget build(BuildContext context) {
    return PaymentOption();
  }
}

class PaymentOption extends StatefulWidget {
  @override
  _PaymentOptionState createState() => _PaymentOptionState();
}

class _PaymentOptionState extends State<PaymentOption> {
  var personalSelect = true;
  var businessSelect = false;

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
          titleWidget: ViitTitleWidget("Payment Method"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 21),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: 45,
                  width: MediaQuery.of(context)
                      .size
                      .width, // this will give you fle
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.5),
                      border: Border.all(
                        width: 1,
                        color: Color(0xffF3AA05),
                      )), // xible width not fixed width
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                setState(() {
                                  personalSelect = true;
                                  businessSelect = false;
                                });
                              });
                              print(personalSelect);
                              print(businessSelect);
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: const Radius.circular(4.5),
                                      bottomLeft: const Radius.circular(4.5),
                                    ),
                                    color: personalSelect
                                        ? Color(0xffF3AA05)
                                        : Colors.white),
                                alignment: Alignment.topCenter,
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.person,
                                        size: 24,
                                        color: personalSelect
                                            ? Colors.white
                                            : kLoginBlack,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Personal',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            color: personalSelect
                                                ? Colors.white
                                                : Colors.black,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      //varaible above
                                    ],
                                  ),
                                )),
                          )),
                      Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                personalSelect = false;
                                businessSelect = true;
                              });
                            },
                            child: Container(
                                alignment: Alignment.bottomCenter,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight: const Radius.circular(4.5),
                                      bottomRight: const Radius.circular(4.5),
                                    ),
                                    color: businessSelect
                                        ? Color(0xffF3AA05)
                                        : Colors.white),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Viiticons.work,
                                        size: 20,
                                        color: businessSelect
                                            ? Colors.white
                                            : kLoginBlack,
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Text('Business',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              color: businessSelect
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontWeight: FontWeight.w500)),
                                      //varaible above
                                    ],
                                  ),
                                )),
                          )),
                    ],
                  ),
                ),
                personalSelect
                    ? PersionalPaymentMethodScreen()
                    : BusinessPaymentScreen(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PersionalPaymentMethodScreen extends StatefulWidget {
  @override
  _PersionalPaymentMethodScreenState createState() =>
      _PersionalPaymentMethodScreenState();
}

class _PersionalPaymentMethodScreenState
    extends State<PersionalPaymentMethodScreen> {
  var isSelected;
  var selectIndex;

  @override
  Widget build(BuildContext context) {
    var listText = List<String>();

    listText.add("Cash");
    listText.add("Credit/Debit Card");
    listText.add("Google Pay");
    listText.add("Apple Pay");

    return Column(children: <Widget>[
      ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (
          BuildContext context,
          int index,
        ) {
          return Column(children: <Widget>[
            SizedBox(
              height: 10,
            ),
            PaymentMethodsWidget(
              isImage: index > 1 ? true : false,
              assetImage: index == 2 ? "assets/google.png" : "assets/apple.png",
              icon: index == 0 ? Viiticons.cash : Viiticons.payment,
              radioTxt: listText[index],
              myOnTap: (val) {
                setState(() {
                  print(index);
                  isSelected = index + 1;
                });
              },
              radiovalue: index + 1,
              isSelected: isSelected,
              onTapMasterCard: () {
                setState(() {
                  selectIndex = 2;
                });
              },
              oTapVisa: () {
                setState(() {
                  selectIndex = 1;
                });
              },
              selectIndex: selectIndex,
            ),
          ]);
        },
      ),
      SizedBox(
        height: 25,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10, bottom: 21),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              child: Text(
                "Add Payment Method",
                style: Theme.of(context).textTheme.caption.copyWith(
                      fontWeight: FontWeight.w500,
                      color: kPrimaryColor,
                      fontSize: 15,
                    ),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(
                  AddPaymentMethodScreen.routeName,
                );
              },
            )
          ],
        ),
      )
    ]);
  }
}

class BusinessPaymentScreen extends StatefulWidget {
  @override
  _BusinessPaymentScreenState createState() => _BusinessPaymentScreenState();
}

class _BusinessPaymentScreenState extends State<BusinessPaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          height: 280,
          decoration: BoxDecoration(
            color: Color(0XFFEDEBEB),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(18),
          margin: const EdgeInsets.only(top: 16),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Viiticons.work,
                    color: kLoginBlack,
                    size: 28,
                  ),
                  SizedBox(
                    width: 18,
                  ),
                  Container(
                      child: Text(
                    "Get more with business\ntravel",
                    style: Theme.of(context).textTheme.caption.copyWith(
                          color: kLoginBlack,
                          fontSize: 20,
                        ),
                  ))
                ],
              ),
              SizedBox(
                height: 26,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.check,
                    color: kPrimaryColor,
                    size: 18,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Quicker, easier expensing ",
                        style: Theme.of(context).textTheme.caption.copyWith(
                              color: kPrimaryColor,
                              fontSize: 16,
                            ),
                      ),
                      Text(
                        "Automatically sync with expensing apps",
                        style: Theme.of(context).textTheme.caption.copyWith(
                              color: kTextLoginfaceid,
                              fontSize: 14,
                              letterSpacing: 0.17,
                            ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.check,
                    color: kPrimaryColor,
                    size: 18,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Keep work rides separate ",
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            .copyWith(color: kPrimaryColor, fontSize: 16),
                      ),
                      Text(
                        "Get receipts at your work email",
                        style: Theme.of(context).textTheme.caption.copyWith(
                          color: kTextLoginfaceid,
                          fontSize: 14,
                          letterSpacing: 0.17,
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.check,
                    color: kPrimaryColor,
                    size: 18,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Get travel reports ",
                        style: Theme.of(context).textTheme.caption.copyWith(
                              color: kPrimaryColor,
                              fontSize: 16,
                            ),
                      ),
                      Text(
                        "See trip activity all in one place",
                        style: Theme.of(context).textTheme.caption.copyWith(
                          color: kTextLoginfaceid,
                          fontSize: 14,
                          letterSpacing: 0.17,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 120,),
        Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: FlatButtonWidget(
                  btnTxt: "Turn on",
                  btnColor: kAccentColor,
                  btnOnTap: () {

                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/*Row(
children: <Widget>[
Expanded(
child: Padding(
padding: const EdgeInsets.symmetric(horizontal: 16),
child: FlatButtonWidget(
btnTxt: "Turn on",
btnColor: kAccentColor,
btnOnTap: () {

},
),
),
),
],
)*/

class PaymentMethodsWidget extends StatelessWidget {
  final int radiovalue;
  final bool isImage;
  IconData icon;
  String assetImage;
  final String radioTxt;
  final int isSelected;
  final Function myOnTap;
  final Function oTapVisa;
  final Function onTapMasterCard;
  final int selectIndex;

  PaymentMethodsWidget({
    Key key,
    this.isSelected,
    this.isImage = false,
    this.icon,
    this.assetImage,
    this.radioTxt,
    this.radiovalue,
    this.myOnTap,
    this.oTapVisa,
    this.onTapMasterCard,
    this.selectIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Card(
            color: Color(0XFFEDEBEB),
            child: Padding(
                padding: const EdgeInsets.only(
                    left: 10, top: 15, right: 10, bottom: 15),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            isImage
                                ? Image.asset(
                                    assetImage,
                                    height: 32,
                                    width: 32,
                                  )
                                : Icon(
                                    icon,
                                    color: Colors.black,
                                    size: 24,
                                  ),
                            SizedBox(
                              width: 16,
                            ),
                            Text(
                              radioTxt,
                              style:
                                  Theme.of(context).textTheme.caption.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: kLoginBlack,
                                        fontSize: 18,
                                      ),
                            )
                          ],
                        ),
                        Transform.scale(
                          scale: 1.3,
                          child: Radio(
                            activeColor: kPrimaryColor,
                            value: radiovalue,
                            groupValue: isSelected,
                            onChanged: myOnTap,
                          ),
                        )
                      ],
                    ),
                    isSelected == 2 && radiovalue == 2
                        ? Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 30,
                                ),
                                GestureDetector(
                                  onTap: oTapVisa,
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Icon(
                                          Viiticons.visa_card,
                                          color: kTextLoginfaceid,
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "**** **** **** 5967",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption
                                                  .copyWith(
                                                      color: kTextLoginfaceid,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 14),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        selectIndex == 1
                                            ? Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Expanded(
                                                      flex: 5,
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 15),
                                                        margin: const EdgeInsets
                                                            .only(right: 10),
                                                        height: 48,
                                                        width: 120,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        child: TextField(
                                                          decoration:
                                                              InputDecoration(
                                                            focusColor:
                                                                Colors.green,
                                                            border: InputBorder
                                                                .none,
                                                            hintText:
                                                                "Enter CVV",
                                                            hintStyle: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .caption
                                                                .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        15,
                                                                    color: Colors
                                                                        .black45),
                                                            fillColor:
                                                                Colors.red,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 4,
                                                      child: Container(
                                                        height: 48,
                                                        child: FlatButtonWidget(
                                                          btnOnTap: () {},
                                                          btnTxt: "Done",
                                                          btnColor:
                                                              kPrimaryColor,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            : SizedBox()
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: 0.5,
                                  width: MediaQuery.of(context).size.width - 90,
                                  color: Colors.grey,
                                  child: Row(),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                GestureDetector(
                                  onTap: onTapMasterCard,
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Icon(
                                          Viiticons.master_card,
                                          color: kTextLoginfaceid,
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "**** **** **** 5967",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption
                                                  .copyWith(
                                                    color: kTextLoginfaceid,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14,
                                                  ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        selectIndex == 2
                                            ? Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Expanded(
                                                      flex: 5,
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 15),
                                                        margin: const EdgeInsets
                                                            .only(right: 10),
                                                        height: 48,
                                                        width: 120,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        child: TextField(
                                                          decoration:
                                                              InputDecoration(
                                                            focusColor:
                                                                Colors.green,
                                                            border: InputBorder
                                                                .none,
                                                            hintText:
                                                                "Enter CVV",
                                                            hintStyle: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .caption
                                                                .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        15,
                                                                    color: Colors
                                                                        .black45),
                                                            fillColor:
                                                                Colors.red,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 4,
                                                      child: Container(
                                                        height: 48,
                                                        child: FlatButtonWidget(
                                                          btnOnTap: () {},
                                                          btnTxt: "Done",
                                                          btnColor:
                                                              kPrimaryColor,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            : SizedBox()
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        : SizedBox(),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
