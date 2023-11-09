import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:urban_restaurant/screens/login_screen.dart';
import 'package:urban_restaurant/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 10), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              'images/assets/ethioclickslogo.png',
              fit: BoxFit.cover,
            ),
          ),
          const Positioned(
            top: 0,
            right: 0,
            bottom: 0,
            left: 0,
            child: SpinKitFadingCircle(
              color: AppColors.tertiary,
              size: 70.0,
            ),
          )
        ],
      ),
    );
  }
}
