import 'package:flutter/material.dart';
import 'package:flutter_task_management_app/ui/screens/login_screen.dart';
import 'package:flutter_task_management_app/ui/screens/sign_up_screen.dart';
import 'package:flutter_task_management_app/ui/style.dart';
import '../widgets/body_background_widget.dart';

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({super.key});

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BodyBackgroundWidget(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  Text(
                    "PIN Verification",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 10,),
                  const Text(
                    "A 6 digit verification pin sent to your email address",
                    style: TextStyle(
                      color: colorGray,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: inputStyle("Email"),
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {

                      },
                      child: const Text("Verify", style: TextStyle(fontSize: 16),),
                    ),
                  ),
                  const SizedBox(height: 48,),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account?",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: colorGray,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen(),),);
                          },
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                              color: Colors.green.shade300, fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
