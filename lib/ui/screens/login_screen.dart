import 'package:flutter/material.dart';
import '../widgets/body_background_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BodybackgroundWidget(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 30, vertical: MediaQuery.sizeOf(context).height * 0.2,),
            child: Column(
              children: [
                Text("Get Started With")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
