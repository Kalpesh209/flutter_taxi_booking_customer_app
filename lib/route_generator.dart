import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/book_taxi/location_information/where_to/where_to_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/book_taxi/ongoing_trip/ratting/ratting_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/book_taxi/vehicle_information_screen/payment_method/payment_option.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/book_taxi/vehicle_information_screen/vehicle_information_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/common/add_address_to_mylist/add_address_to_mylist.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/common/location_from_map/location_from_map_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/free_rides/free_rides_how_work_details_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/help_support/contact_us/contact_us_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/help_support/feedback/feedback_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/help_support/help_support_questions/help_support_questions_ans_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/help_support/help_support_questions/help_support_questions_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/home_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/loyalty_program/loyalty_program_details_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/payment/add_payment_method/add_apple_pay/add_apple_pay_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/payment/add_payment_method/add_business_profile/add_business_profile_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/payment/add_payment_method/add_business_profile/choose_payment_method_for_default.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/payment/add_payment_method/add_business_profile/whats_your_business_email_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/payment/add_payment_method/add_card/add_card_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/payment/add_payment_method/add_payment_method_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/payment/add_payment_method/ride_personal_profile/edit_profile_name_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/payment/add_payment_method/ride_personal_profile/ride_personal_profile_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/payment/apple_pay/apple_pay_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/payment/cash/cash_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/payment/credit_card/credit_card_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/payment/gpay/g_pay_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/profile/change_password_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/settings/emergency_contacts/emergency_contact_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/settings/fav_address/edit_fav_address_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/settings/fav_address/fav_address_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/settings/fav_driver/fav_driver_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/language/language_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/loginsignup/login/login_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/loginsignup/login_faceid/login_faceid_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/loginsignup/reset_password/forgot/forgot_password_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/loginsignup/reset_password/otp/otp_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/loginsignup/reset_password/reset/reset_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/loginsignup/signup/signup_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/onboard/onboard_screen.dart';


class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case LanguageScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => LanguageScreen(),
        );

      case OnBoardScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => OnBoardScreen(),
        );

      case LoginScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );

      case ForgotPasswordScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => ForgotPasswordScreen(),
        );

      case OTPScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => OTPScreen(),
        );

      case ResetPassScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => ResetPassScreen(),
        );

      case LoginFaceIDScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => LoginFaceIDScreen(),
        );

      /*case HomeScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );*/

      case HomeScreen.routeName:
        return PageRouteBuilder(
            pageBuilder: (context, animation, Animation secondaryAnimation) =>
                HomeScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return ScaleTransition(
                scale: Tween<double>(
                  begin: 0.0,
                  end: 1.0,
                ).animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: Curves.fastOutSlowIn,
                  ),
                ),
                child: child,
              );
            });

      case LoyaltyProgramDetailsScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => LoyaltyProgramDetailsScreen(),
        );

      case FreeRidesHowWorkDetailsScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => FreeRidesHowWorkDetailsScreen(),
        );

      case CashScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => CashScreen(),
        );

      case CreditCardScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => CreditCardScreen(),
        );

      case CreditCardScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => CreditCardScreen(),
        );

      case ApplePayScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => ApplePayScreen(),
        );

      case GPayScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => GPayScreen(),
        );

      case AddPaymentMethodScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => AddPaymentMethodScreen(),
        );

      case AddCardScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => AddCardScreen(),
        );

      case SignupScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => SignupScreen(),
        );

      case EmergencyContactScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => EmergencyContactScreen(),
        );

      case FavAddressScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => FavAddressScreen(),
        );

      case EditFavAddressScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => EditFavAddressScreen(),
        );

      case FavDriverScreen.routeName:
        return CupertinoPageRoute(
          builder: (_) => FavDriverScreen(),
        );

      case ContactUsScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => ContactUsScreen(),
        );

      case FeedBackScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => FeedBackScreen(),
        );

      case HelpSupportQuestionsScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => HelpSupportQuestionsScreen(),
        );

      case AddApplePayScreen.routeName:
        // Validation of correct data type
        if (args is PayMethodsModal) {
          return MaterialPageRoute(
            builder: (_) => AddApplePayScreen(
              args: args,
            ),
          );
        }
        // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.
        return _errorRoute();
      case RidePersonalProfileScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => RidePersonalProfileScreen(),
        );

      case EditProfileNameScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => EditProfileNameScreen(),
        );

      case AddBusinessProfileScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => AddBusinessProfileScreen(),
        );

      case WhatsYourBusinessEmailScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => WhatsYourBusinessEmailScreen(),
        );

      case ChoosePaymentMethodScreen.routeName:
        if (args is ChoosePaymentMethodScreenArguments) {
          return MaterialPageRoute(
            builder: (_) => ChoosePaymentMethodScreen(
              arguments: args,
            ),
          );
        }
        // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.
        return _errorRoute();

      case PaymentOptionScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => PaymentOptionScreen(),
        );

      case HelpSupportQuestionAnswerScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => HelpSupportQuestionAnswerScreen(),
        );

      case ChangePasswordScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => ChangePasswordScreen(),
        );

      case AddAddressToMylistScreen.routeName:
        // Validation of correct data type
        if (args is AddAddressToMylistScreenArguments) {
          return MaterialPageRoute(
            builder: (_) => AddAddressToMylistScreen(
              arguments: args,
            ),
          );
        }
        // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.
        return _errorRoute();

      case LocationFromMapScreen.routeName:
        // Validation of correct data type
        if (args is LocationFromMapScreenArguments) {
          return MaterialPageRoute(
            builder: (_) => LocationFromMapScreen(
              arguments: args,
            ),
          );
        }
        // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.
        return _errorRoute();

      case WhereToScreen.routeName:
        // Validation of correct data type
        if (args is WhereToScreenArguments) {
          return MaterialPageRoute(
            builder: (_) => WhereToScreen(
              arguments: args,
            ),
          );
        }
        // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.
        return _errorRoute();

      case VehicleInformationScreen.routeName:
        // Validation of correct data type
        if (args is VehicleInformationScreenArguments) {
          return MaterialPageRoute(
            builder: (_) => VehicleInformationScreen(
              arguments: args,
            ),
          );
        }
        // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.
        return _errorRoute();
      case RattingScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => RattingScreen(),
        );
      default:
        return _errorRoute();
    }

    /*switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => FirstPage());
      case '/second':
        // Validation of correct data type
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => SecondPage(
              data: args,
            ),
          );
        }
        // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.
        return _errorRoute();
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }*/
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Error'),
          ),
          body: Center(
            child: Text('ERROR'),
          ),
        ),
      );
    });
  }
}
