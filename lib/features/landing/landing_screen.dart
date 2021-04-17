import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_taxi_booking_customer_app/app_translations_delegate.dart';
import 'package:flutter_taxi_booking_customer_app/application.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_const.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_theme.dart';
import 'package:flutter_taxi_booking_customer_app/common/viiticons_icons.dart';
import 'package:flutter_taxi_booking_customer_app/features/language/language_screen.dart';
import 'package:flutter_taxi_booking_customer_app/route_generator.dart';


import 'bloc/bloc.dart';

///The main landing screen where we can write code for app main door.
class LandingScreen extends StatefulWidget {
  Locale defaultLocale;

  LandingScreen(this.defaultLocale);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  void initState() {
    super.initState();
    print("LandingScreen() init");
    application.onLocaleChanged = onLocaleChange;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("LandingScreen() didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    print("LandingScreen() build");
    return MaterialApp(
      title: kAppName,
      theme: kAppThemeData,
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        child: Landing(),
        create: (context) => LandingBloc(),
      ),
      localizationsDelegates: [
        AppTranslationsDelegate(newLocale: widget.defaultLocale),
        //provides localised strings
        GlobalMaterialLocalizations.delegate,
        //provides RTL support
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: application.supportedLocales(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    print("LandingScreen() dispose");
  }

  void onLocaleChange(Locale locale) {
    setState(() {
      print("LandingScreen() new language change ${locale.languageCode}");
      widget.defaultLocale = locale;
    });
  }
}

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  LandingBloc landingBloc;

  @override
  void initState() {
    super.initState();
    print("Landing() initState");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("Landing() didChangeDependencies");
    landingBloc = BlocProvider.of<LandingBloc>(context);
    landingBloc.add(
      LandingIsGuest(),
    );
  }

  @override
  Widget build(BuildContext context) {
    print("Landing() build");
    return SafeArea(
      child: Scaffold(
        body: BlocListener<LandingBloc, LandingState>(
          listener: (context, state) {
            print("BLoC listener: $state");
            if (state is LandingGoToUser) {
              /*Navigator.of(context).pushNamed(
                HomeScreen.routeName,
              );*/
            } else if (state is LandingGoToGuest) {
              Navigator.of(context).pushReplacementNamed(
                LanguageScreen.routeName,
              );
            }
          },
          child: BlocBuilder<LandingBloc, LandingState>(
            builder: (context, state) {
              print("BLoC builder: $state");

              if (state is LandingInitialState) {
                return _buildLoadingState();
              } else if (state is LandingLoadingState) {
                return _buildLoadingState();
              } else if (state is ErrorState) {
                return _buildErrorState(state.errorMsg);
              } else {
                return _buildLoadingState();
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    print("Landing() dispose");
    landingBloc.close();
  }

  _buildLoadingState() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  _buildErrorState(msg) {
    return Center(
      child: GestureDetector(
        child: Text(msg),
        onTap: () {
          landingBloc.add(
            LandingIsGuest(),
          );
        },
      ),
    );
  }

  _buildTempleWidgetsDemo() {
    return SingleChildScrollView(
      child: Container(
        width: 120,
        child: Column(
          children: <Widget>[
            /*ViitAppBar(
              leadingWidget: ViitAppBarIconWidget(),
              titleWidget: ViitTitleWidget("Add Favorite Address"),
              onLeadingPressed: () {
                Navigator.of(context).pop();
              },
              isActionWidget: true,
              actionWidget: ViitAppBarIconWidget(
                viitAppBarIconType: ViitAppBarIconTypes.ICON,
                myLeadingIcon: Icon(
                  CupertinoIcons.delete_solid,
                  color: Colors.white,
                  size: 28,
                ),
                bgColor: Colors.transparent,
              ),
              onActionPressed: () {
                print("Press in action icon");
              },
            ),
            ViitAppBarIconWidget(
              viitAppBarIconType: ViitAppBarIconTypes.ICON,
              myLeadingIcon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              bgColor: kPrimaryColor,
              iconColor: Colors.white,
            ),
            LanguageButton(
              btnTxt: "English",
              btnColor: kAccentColor,
              btnOnTap: () {
                print("");
              },
            ),
            SizedBox(
              height: 12,
            ),
            LanguageButton(
              btnTxt: "French",
              btnOnTap: () {
                print("");
              },
              isShowIcon: true,
            ),
            SocialMediaWidget(
              assetPath: "assets/google.png",
              bgColor: kSocialBg,
            ),
            SizedBox(
              height: 16,
            ),
            FABButton(
              bgColor: kAccentColor,
              icon: Icon(
                Icons.sync,
                color: Colors.white,
              ),
              onTap: () {},
            ),
            SizedBox(
              height: 16,
            ),
            SquareTextFieldWidget(
              onChanged: (str) {},
              onSubmited: (str) {},
              inputType: TextInputType.text,
              inputAction: TextInputAction.done,
              hintText: "Write name",
            ),
            SizedBox(
              height: 16,
            ),
            CountrySelectionTextField(
              onChanged: (str) {},
              onSubmited: (str) {},
            ),
            SizedBox(
              height: 16,
            ),
            PasswordFormField(
              hintText: "Type Password",
              inputAction: TextInputAction.done,
              onChanged: (str) {},
              onSubmited: (str) {},
              myController: TextEditingController(),
            ),
            SizedBox(
              height: 32,
            ),*/
            Icon(
              Viiticons.home,
              size: 32,
              color: kAccentColor,
            ),
            SizedBox(
              height: 6,
            ),
            Icon(
              Viiticons.work,
              size: 32,
              color: kAccentColor,
            ),
            SizedBox(
              height: 6,
            ),
            Icon(
              Viiticons.loved,
              size: 32,
              color: kAccentColor,
            ),
            SizedBox(
              height: 6,
            ),
            Icon(
              Viiticons.star,
              size: 32,
              color: kAccentColor,
            ),
            SizedBox(
              height: 6,
            ),
            Icon(
              Viiticons.history,
              size: 32,
              color: kAccentColor,
            ),
            SizedBox(
              height: 6,
            ),
            Icon(
              Viiticons.location,
              size: 32,
              color: kAccentColor,
            ),
            SizedBox(
              height: 6,
            ),
            Icon(
              Viiticons.info,
              size: 32,
              color: kAccentColor,
            ),
            SizedBox(
              height: 6,
            ),
            Icon(
              Viiticons.promo,
              size: 32,
              color: kAccentColor,
            ),
            SizedBox(
              height: 6,
            ),
            Icon(
              Viiticons.payment,
              size: 32,
              color: kAccentColor,
            ),
            SizedBox(
              height: 6,
            ),
            Icon(
              Viiticons.master_card,
              size: 32,
              color: kAccentColor,
            ),
            SizedBox(
              height: 6,
            ),
            Icon(
              Viiticons.visa_card,
              size: 32,
              color: kAccentColor,
            ),
            SizedBox(
              height: 6,
            ),
            Icon(
              Viiticons.card,
              size: 32,
              color: kAccentColor,
            ),
            SizedBox(
              height: 6,
            ),
            Icon(
              Viiticons.photo_camera,
              size: 32,
              color: kAccentColor,
            ),
            SizedBox(
              height: 6,
            ),
            SizedBox(
              height: 6,
            ),
            Icon(
              Viiticons.chat,
              size: 32,
              color: kAccentColor,
            ),
            SizedBox(
              height: 6,
            ),
            SizedBox(
              height: 6,
            ),
            Icon(
              Viiticons.share_eta,
              size: 32,
              color: kAccentColor,
            ),
            SizedBox(
              height: 6,
            ),
          ],
        ),
      ),
    );
  }
}
