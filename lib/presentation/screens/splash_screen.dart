import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../config/alfred_constants.dart';

class SplashScreen extends StatelessWidget {

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      context.go(AlfredConstants.routeLoadingScreen);
    });
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/splash.png',
          fit: BoxFit.cover, // Or BoxFit.fill based on your image
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }
}
