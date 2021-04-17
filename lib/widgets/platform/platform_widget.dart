import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Base class to be extended by all platform aware widgets
abstract class PlatformWidget extends StatelessWidget {
  PlatformWidget({Key key}) : super(key: key);

  Widget buildCupertinoWidget(BuildContext context);

  Widget buildMaterialWidget(BuildContext context);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      // Use Cupertino on iOS
      return buildCupertinoWidget(context);
    }
    // Use Material design on Android and other platforms
    return buildMaterialWidget(context);
  }
}
