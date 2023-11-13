import 'package:flutter/material.dart';
import 'package:flutter_task_management_app/ui/screens/login_screen.dart';
import 'package:flutter_task_management_app/ui/style.dart';
import '../widgets/body_background_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                    height: 50,
                  ),
                  Text(
                      "Join With Us",
                      style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: inputStyle("Email"),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: inputStyle("First Name"),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: inputStyle("Last Name"),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: inputStyle("Mobile"),
                  ),
                  const SizedBox(height: 15),



                  TextFormField(
                    obscureText: true,
                    decoration: inputStyle("Password"),
                  ),

                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Icon(Icons.arrow_circle_right_outlined),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       const Text("Already have an account?", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: colorGray),),
                        TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.green.shade300,
                              fontSize: 16,
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
