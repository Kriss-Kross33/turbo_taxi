import 'package:flutter/material.dart';
import 'package:turbo_taxi/src/core/constants/route_consts.dart';
import 'package:turbo_taxi/src/features/home/pages/home_screen.dart';
import 'package:turbo_taxi/src/features/login/pages/login_screen.dart';
import 'package:turbo_taxi/src/features/signup/pages/signup_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConsts.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case RouteConsts.signup:
        return MaterialPageRoute(builder: (context) => const SignupScreen());
      case RouteConsts.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (BuildContext context) => Scaffold(
        body: Column(
          children: const [
            Center(
              child: Text(
                'ERROR: UNKNOWN ROUTE',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
