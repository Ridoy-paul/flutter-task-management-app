import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../utility/utility.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    goToLogin();
  }

  void goToLogin() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SvgPicture.asset(
              backgroundImage,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Center(
              child: SvgPicture.asset(logo),
            )
          ],
        ),
      ),
    );
  }
}
