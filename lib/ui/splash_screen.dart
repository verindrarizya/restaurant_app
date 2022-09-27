import 'dart:async';

import 'package:flutter/material.dart';
import 'package:restaurant_app/ui/restaurant_list_page.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/splash_screen";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/logo.png",
          height: 200,
          width: 200,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 2),
        () => Navigator.pushReplacementNamed(
            context, RestaurantListPage.routeName));
  }
}
