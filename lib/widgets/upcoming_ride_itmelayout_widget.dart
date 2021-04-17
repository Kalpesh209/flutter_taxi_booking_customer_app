import 'package:flutter/material.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';


class UpcomingRideItmeLayoutWidget extends StatelessWidget {
  final String rideTime;
  final String rideName;
  final String droopupAddress;
  final String pickupAddress;
  final String rideImage;
  final String rideAmount;

  UpcomingRideItmeLayoutWidget({
    Key key,
    @required this.rideName,
    @required this.rideTime,
    @required this.droopupAddress,
    @required this.pickupAddress,
    @required this.rideImage,
    @required this.rideAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              width: 2,
              color: kSettingDivider,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Container(
                  child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Opacity(
                      opacity: 0.64,
                      child: Text(
                        rideTime,
                        style: Theme.of(context).textTheme.caption.copyWith(
                              fontSize: 15,
                              color: kLoginBlack,
                            ),
                      ),
                    ),
                    Text(
                      rideName,
                      style: Theme.of(context).textTheme.caption.copyWith(
                            fontSize: 18,
                            color: kLoginBlack,
                          ),
                    ),
                  ],
                ),
              )),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    image: AssetImage(rideImage),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            height: 55,
                            width: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  height: 8,
                                  width: 8,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8 / 2),
                                    color: kLoginBlack,
                                  ),
                                ),
                                MediaQuery.removePadding(
                                  context: context,
                                  removeTop: true,
                                  removeRight: true,
                                  removeLeft: true,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: 11,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Column(
                                          children: <Widget>[
                                            SizedBox(
                                              height: 1,
                                            ),
                                            Container(
                                              height: 2,
                                              width: 2,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          2 / 2),
                                                  color: kLoginBlack),
                                            ),
                                          ],
                                        );
                                      }),
                                ),
                                SizedBox(
                                  height: 1,
                                ),
                                Container(
                                  height: 8,
                                  width: 8,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(8 / 2),
                                      color: Colors.red),
                                ),
                              ],
                            )),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Opacity(
                                opacity: 0.64,
                                child: Text(
                                  pickupAddress,
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption
                                      .copyWith(
                                        fontSize: 15,
                                        color: kLoginBlack,
                                      ),
                                ),
                              ),
                              SizedBox(
                                height: 21,
                              ),
                              Opacity(
                                opacity: 0.64,
                                child: Text(
                                  droopupAddress,
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption
                                      .copyWith(
                                        fontSize: 14,
                                        color: kLoginBlack,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Text(
                      rideAmount,
                      style: Theme.of(context).textTheme.caption.copyWith(
                            fontSize: 22,
                            color: kPrimaryColor,
                          ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        )
      ],
    );
  }
}
