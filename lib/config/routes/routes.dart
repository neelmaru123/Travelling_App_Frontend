
import 'package:flutter/material.dart';
import 'package:travelling_app/config/components/add_review_screen_1.dart';
import 'package:travelling_app/config/components/add_review_screen_2.dart';
import 'package:travelling_app/config/routes/routes_name.dart';
import 'package:travelling_app/views/home_screen.dart';
import 'package:travelling_app/views/login_screen.dart';
import 'package:travelling_app/views/placeByIdComponents/place_data.dart';
import 'package:travelling_app/views/signup_screen.dart';
import 'package:travelling_app/views/welcome_screen.dart';

class Routes{

  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RoutesName.welcomeScreen:
      return MaterialPageRoute(builder: (context) => WelcomeScreen());
        break;
      case RoutesName.loginScreen:
        return MaterialPageRoute(builder: (context) => LoginScreen()  );
        break;
      case RoutesName.signUpScreen:
        return MaterialPageRoute(builder: (context) => SignUpScreen());
        break;
      case RoutesName.homeScreen:
        return MaterialPageRoute(builder: (context) => HomeScreen());
        break;
      case RoutesName.placeDataScreen:
        final String id = settings.arguments as String;
        return MaterialPageRoute(builder: (context) => PlaceData(placeId: id));
        break;
      case RoutesName.addReviewScreen1:
        final String id = settings.arguments as String;
        return MaterialPageRoute(builder: (context) => AddReviewScreen1(placeId: id));
        break;
      case RoutesName.addReviewScreen2:
        final Map<String, dynamic> review = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(builder: (context) => AddReviewScreen2(review: review,));
        break;

      default:
        return MaterialPageRoute(builder: (context) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}