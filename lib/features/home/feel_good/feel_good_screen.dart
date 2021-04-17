import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/feel_good/bloc/feel_good_bloc.dart';



class FeelGoodScreen extends StatelessWidget {
  static const String routeName = "feelgood";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: FeelGood(),
      create: (context) => FeelGoodBloc(),
    );
  }
}

class FeelGood extends StatefulWidget {
  @override
  _FeelGoodState createState() => _FeelGoodState();
}

class _FeelGoodState extends State<FeelGood> {
  final imageArry = [
    "assets/wwf.png",
    "assets/greenpeace.png",
    "assets/les_rest.png"
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Image.asset(
            "assets/donate.png",
            width: 221,
            height: 221,
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Column(
              children: <Widget>[
                Text(
                  "Do good, feel good!",
                  style: Theme.of(context).textTheme.caption.copyWith(
                        fontWeight: FontWeight.w500,
                        color: kLoginBlack,
                        fontSize: 20,
                      ),
                ),
                SizedBox(
                  height: 20,
                ),
                Opacity(
                  opacity: 0.9,
                  child: Text(
                    "As per our motto, every ride counts. YOU are the protagonist with your Vitt rides!",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.caption.copyWith(
                          color: kTextLoginfaceid,
                          fontSize: 15,
                          letterSpacing: 0.35,
                        ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Opacity(
                  opacity: 0.9,
                  child: Text(
                    "Without you adding extra money, we donate 1% of your rides to your favourite charity. Choose it below!",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.caption.copyWith(
                          color: kTextLoginfaceid,
                          fontSize: 15,
                          letterSpacing: 0.35,
                        ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          Container(
            height: 100,
            margin: const EdgeInsets.only(bottom: 15),
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              removeRight: true,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: imageArry.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        height: 100,
                        width: 100,
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(width: 1, color: Color(0XFFC6C2C2))),
                        child: Center(
                          child: Image.asset("${imageArry[index]}"),
                        ));
                  }),
            ),
          ),
          Container(
            height: 80,
            color: Color(0xFFF3F3F3),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Your contribution",
                  style: Theme.of(context).textTheme.caption.copyWith(
                        color: kLoginBlack,
                        fontSize: 18,
                      ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "€ 2.5",
                      style: Theme.of(context).textTheme.caption.copyWith(
                            color: kPrimaryColor,
                            fontSize: 22,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              "Check the monthly newsletter to find out more about our Feel Good campaign!",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.caption.copyWith(
                    color: kPrimaryColor,
                    fontSize: 14,
                  ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Vitt cares",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.caption.copyWith(
                      color: kPrimaryColor,
                      fontSize: 14,
                    ),
              ),
              SizedBox(
                width: 2,
              ),
              Icon(
                Icons.favorite,
                size: 20,
                color: Colors.red,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
