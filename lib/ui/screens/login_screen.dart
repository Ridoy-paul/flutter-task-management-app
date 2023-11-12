import 'package:flutter/material.dart';
import '../widgets/body_background_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BodybackgroundWidget(
          child: Container(),
        ),
      ),
    );
  }
}
