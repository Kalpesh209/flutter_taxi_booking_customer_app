import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';


class DialogLoadingWidget extends StatelessWidget {
  final String titleText;

  DialogLoadingWidget({
    Key key,
    @required this.titleText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 56, vertical: 32),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                top: 15,
                bottom: 4,
              ),
              child: CupertinoTheme(
                data: CupertinoTheme.of(context)
                    .copyWith(brightness: Brightness.light),
                child: CupertinoActivityIndicator(
                  radius: 32,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                top: 15,
                bottom: 15,
              ),
              child: Text(
                titleText,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.caption.copyWith(
                      fontSize: 18,
                      color: kBlack,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
