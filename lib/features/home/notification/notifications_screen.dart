import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/notifications_widget.dart';


import 'bloc/bloc.dart';

class NotificationsScreen extends StatelessWidget {
  static const String routeName = "notifications";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationsBloc(),
      child: Notifications(),
    );
  }
}

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List<String> _notificationTitles = [
    "Account and ride updates ",
    "Discounts and news",
    "Account and ride updates ",
  ];
  List<String> _notificationDes = [
    "Includes ride status notifications and updates related to riding on your account.",
    "Includes special offers, recommendations, and product updates.",
    "Includes ride status notifications and updates related to riding on your account.",
  ];

  @override
  void initState() {
    super.initState();
    print("Notification() init");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("Notification() didChangeDependencies");
  }

  @override
  void dispose() {
    super.dispose();
    print("Notification() dispose");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) => NotificationWidget(
          headerTxt: _notificationTitles[index],
          descriptionTxt: _notificationDes[index],
          isLastIndex: index == 2,
        ),
      ),
    );
  }
}
