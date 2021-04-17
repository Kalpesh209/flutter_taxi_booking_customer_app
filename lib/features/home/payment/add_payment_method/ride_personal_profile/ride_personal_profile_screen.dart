import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/payment/add_payment_method/add_business_profile/choose_payment_method_for_default.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/payment/add_payment_method/ride_personal_profile/edit_profile_name_screen.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/recent_address_item_list.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/viit_appbar.dart';
import 'bloc/bloc.dart';

class RidePersonalProfileScreen extends StatelessWidget {
  static const String routeName = "ridePersonalProfile";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: RidePersonalProfile(),
      create: (context) => RidePersonalProfileBloc(),
    );
  }
}

class RidePersonalProfile extends StatefulWidget {
  @override
  _RidePersonalProfileState createState() => _RidePersonalProfileState();
}

class _RidePersonalProfileState extends State<RidePersonalProfile> {
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
          titleWidget: ViitTitleWidget("Personal"),
        ),
        body: BlocListener<RidePersonalProfileBloc, RidePersonalProfileState>(
            listener: (BuildContext context, state) {},
            child:
                BlocBuilder<RidePersonalProfileBloc, RidePersonalProfileState>(
              builder: (context, state) {
                print("$state");
                if (state is InitialRidePersonalProfileState) {
                  return _buildInitialState();
                } else if (state is LoadingState) {
                  return _buildLoadingState();
                }
                /*else if (state is DetailQuoteState) {
                  return buildQuoteState(state.quoteDetails, context);
                }*/
                else if (state is ErrorState) {
                  return _buildErrorState(state.errorMsg);
                } else {
                  return Center(
                    child: Text("Unhandled state"),
                  );
                }
              },
            )),
      ),
    );
  }

  Widget _buildInitialState() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                EditProfileNameScreen.routeName,
              );
            },
            child: RecentAddressItemList(
              addressTitle: "Personal",
              myIcon: Icons.person,
              address: "Tap to edit name",
              myBackgrounColor: kPrimaryColor,
              myIconColor: Colors.white,
              isShowEditIcon: false,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Preferences",
            style: Theme.of(context).textTheme.caption.copyWith(
                  color: kLoginBlack,
                  fontSize: 20,
                ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "giampaolo@gmail.com ",
            style: Theme.of(context).textTheme.caption.copyWith(
                  color: kPrimaryColor,
                  fontSize: 16,
                ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Tap to edit recepit email",
            style: Theme.of(context)
                .textTheme
                .caption
                .copyWith(color: kDottedBorder, fontSize: 14),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Cash",
            style: Theme.of(context).textTheme.caption.copyWith(
                  color: kPrimaryColor,
                  fontSize: 16,
                ),
          ),
          SizedBox(
            height: 5,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                ChoosePaymentMethodScreen.routeName,
              );
            },
            child: Text(
              "Tap to edit default payment",
              style: Theme.of(context).textTheme.caption.copyWith(
                    color: kDottedBorder,
                    fontSize: 14,
                  ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "When you ride using this profile, these preferences will be selected by default.",
            style: Theme.of(context).textTheme.caption.copyWith(
                  color: kDottedBorder,
                  fontSize: 14,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingState() {
    return Container();
  }

  Widget _buildErrorState(errorMsg) {
    return Container();
  }
}
