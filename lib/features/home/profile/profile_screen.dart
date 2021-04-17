

import 'package:flutter/material.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/country_selection_textfield_widget.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/flat_button_widget.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/square_textfield_widget.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = "profile";

  @override
  Widget build(BuildContext context) {
    return Profile();
  }
}

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var isChecked = true;
  DateTime selectedDate = DateTime.now();
  TextEditingController _date = new TextEditingController();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1901, 1),
        lastDate: DateTime(2100));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        _date.value = TextEditingValue(text: picked.toString());
      });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 146,
              color: Color(0xfff3f3f3),
              child: Column(
                children: <Widget>[
                  Container(
                      child: Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      top: 15,
                      right: 15,
                    ),
                    child: Row(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 15,
                                top: 15,
                              ),
                              child: Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100 / 2),
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/female_avtar.png'),
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                                //color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 76,
                              ),
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(80 / 2),
                                  color: kAccentColor,
                                ),
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                  size: 17,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Melissa Brunt",
                          style: Theme.of(context).textTheme.caption.copyWith(
                                color: kLoginBlack,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 15,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "First Name",
                      style: Theme.of(context).textTheme.caption.copyWith(
                            color: kLoginBlack,
                            fontSize: 16,
                          ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    SquareTextFieldWidget(
                      hintText: "Melissa",
                      inputType: TextInputType.text,
                      inputAction: TextInputAction.done,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      "Last Name",
                      style: Theme.of(context).textTheme.caption.copyWith(
                            color: kLoginBlack,
                            fontSize: 16,
                          ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    SquareTextFieldWidget(
                      hintText: "Brunt",
                      inputType: TextInputType.text,
                      inputAction: TextInputAction.done,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Nick Name",
                          style: Theme.of(context).textTheme.caption.copyWith(
                                color: kLoginBlack,
                                fontSize: 16,
                              ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              width: 21,
                              height: 21,
                              child: Checkbox(
                                value: isChecked,
                                activeColor: Color(0xff919a9d),
                                onChanged: (val) {
                                  print(val);
                                  setState(() {
                                    isChecked = val;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              "Use Nick Name",
                              style:
                                  Theme.of(context).textTheme.caption.copyWith(
                                        color: kPrimaryColor,
                                        fontSize: 15,
                                      ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    SquareTextFieldWidget(
                      hintText: "Meli",
                      inputType: TextInputType.text,
                      inputAction: TextInputAction.done,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      "Mobile Number",
                      style: Theme.of(context).textTheme.caption.copyWith(
                            color: kLoginBlack,
                            fontSize: 16,
                          ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Stack(
                      children: <Widget>[
                        Align(
                          child: CountrySelectionTextField(
                            hintText: "0464067013",
                            inputType: TextInputType.number,
                            inputAction: TextInputAction.next,
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 21,
                              right: 12,
                            ),
                            child: Text(
                              "Verified",
                              style:
                                  Theme.of(context).textTheme.caption.copyWith(
                                        color: kGreen,
                                      ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Email Address",
                      style: Theme.of(context).textTheme.caption.copyWith(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    SquareTextFieldWidget(
                      hintText: "melissa.brunt69@gmail.com",
                      inputType: TextInputType.emailAddress,
                      inputAction: TextInputAction.done,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      "Date of Birth",
                      style: Theme.of(context).textTheme.caption.copyWith(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    GestureDetector(
                      onTap: () => _selectDate(context),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text(
                              "28 march, 1989",
                              style:
                                  Theme.of(context).textTheme.caption.copyWith(
                                        color: Color(0xffC7C7CA),
                                        fontSize: 16,
                                      ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      "Password",
                      style: Theme.of(context).textTheme.caption.copyWith(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    SquareTextFieldWidget(
                      hintText: "**********",
                      inputType: TextInputType.text,
                      inputAction: TextInputAction.done,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 12,
                        bottom: 12,
                        left: 16,
                        right: 16,
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: FlatButtonWidget(
                                btnColor: Color(0xffF3AA05),
                                btnTxt: "Done",
                                btnOnTap: () {
                                  print("HELLO");
                                }),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                )),
          ],
        )
      ],
    );
  }
}
