import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';
import 'package:flutter_taxi_booking_customer_app/common/viiticons_icons.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/flat_button_widget.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/square_textfield_widget.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/tip_amound_widget.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/viit_appbar.dart';


class RattingScreen extends StatelessWidget {
  static const String routeName = "ratting";

  @override
  Widget build(BuildContext context) {
    return Ratting();
  }
}

class Ratting extends StatefulWidget {
  @override
  _RattingState createState() => _RattingState();
}

class _RattingState extends State<Ratting> {

  var selectRate = 0;
  var selectIndex;
  var isFavrite=false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:  ViitAppBar(
          onLeadingPressed: () {
            Navigator.of(context).pop();
          },
          leadingWidget: ViitAppBarIconWidget(
            viitAppBarIconType: ViitAppBarIconTypes.BACK,
          ),
          titleWidget: ViitTitleWidget("Ratting"),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Stack(
                      children: <Widget>[
                        Container(
                          height: 85,
                          width: 115,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          height: 85,
                          width: 85,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(85 / 2),
                            color: Colors.red,
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/female_avtar.png',
                              ),
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),

                        Positioned(
                            right: 0,
                            top: 10,
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  isFavrite = !isFavrite;
                                });
                              },
                              child:Container(
                                height: 36,
                                width: 36,
                                padding: const EdgeInsets.only(right: 2,top: 2),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40 / 2),
                                  color: kSettingTopBg,
                                ),
                                child:
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Center(
                                      child: Icon(
                                        Viiticons.loved,
                                        size: 20,
                                        color: isFavrite ? kPrimaryColor  : kGrey ,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )

                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Gary Phelps",
                      style: Theme.of(context).textTheme.caption.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Color(0XFF275687),
                          fontSize: 15),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Rate Us",
                      style: Theme.of(context).textTheme.caption.copyWith(
                          fontWeight: FontWeight.w500, color:kBlack, fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 30,
                      margin: const EdgeInsets.only(bottom: 15),
                      child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        removeRight: true,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: 5,
                            itemBuilder: (BuildContext context, int index) {
                              print(selectRate);
                              return Container(
                                  child: Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: GestureDetector(
                                        onTap: () {
                                          print(index);
                                          setState(() {
                                            selectRate = index;
                                          });
                                        },
                                        child: Icon(
                                          Icons.star,
                                          color: index <= selectRate
                                              ? Color(0XFFF7AA01)
                                              : Colors.grey,
                                          size: 40,
                                        ),
                                      )));
                            }),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    FlatButtonWidget(
                      btnOnTap: (){},
                      btnTxt: selectRate<=2 ?"What was missing in tha ride" : "What was good about this ride",
                      btnColor: Color(0xffF3AA05),

                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Text(
                      "Do want to tip your driver?",
                      style: Theme.of(context).textTheme.caption.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Color(0XFF275687),
                          fontSize: 17),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TipAmountWidget(
                      onTapFirstIndex: (){
                        setState(() {
                          selectIndex=1;
                        });
                      },
                      onTapSecendIndex: (){
                        setState(() {
                          selectIndex=2;
                        });
                      },
                      onTapThirdIndex: (){
                        setState(() {
                          selectIndex=3;
                        });
                      },
                      selectIndex: selectIndex,
                    ),

                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      width: 180,
                      height: 40,

                      child: RaisedButton(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: BorderSide(color: Color(0XFF275687))
                        ),
                        onPressed: (){
                          showModalBottomSheet(
                              context: context,
                              builder: (context) =>
                                  Container(
                                    height: 200,
                                 padding:const EdgeInsets.only(left: 20,right: 20,top: 30),
                                    child:Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Enter amount",
                                          style: Theme.of(context).textTheme.caption.copyWith(
                                              fontWeight: FontWeight.w500, color:kBlack, fontSize: 18),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        SquareTextFieldWidget(
                                          hintText: "",
                                          inputAction: TextInputAction.next,
                                          inputType: TextInputType.text,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            FlatButtonWidget(
                                              btnOnTap: (){},
                                              btnTxt: "Submit",
                                              btnColor: Color(0xffF3AA05),
                                            ),
                                          ],
                                        )

                                      ],
                                    ),
                              ));
                        },
                        child: Text(
                          "Another amount",
                          style:Theme.of(context).textTheme.caption.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Color(0XFF275687),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        FlatButtonWidget(
                          btnOnTap: (){},
                          btnTxt: "Submit",
                          btnColor: Color(0xffF3AA05),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              )
              ,
            )
          ],
        ),
      ),
    );
  }
}
