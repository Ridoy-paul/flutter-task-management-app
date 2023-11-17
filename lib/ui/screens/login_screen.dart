import 'package:flutter/material.dart';
import 'package:flutter_task_management_app/data/utility/helpers.dart';
import 'package:flutter_task_management_app/ui/screens/forgot_password_screen.dart';
import 'package:flutter_task_management_app/ui/screens/sign_up_screen.dart';
import 'package:flutter_task_management_app/ui/style.dart';
import '../widgets/body_background_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BodyBackgroundWidget(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: SingleChildScrollView(
              child: Form(
                key: _loginFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    Text("Get Started With",
                        style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: _emailTEController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: inputStyle("Email"),
                      validator: (value) => inputValidate(value, "Please enter the email!"),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: _passwordTEController,
                      obscureText: true,
                      decoration: inputStyle("Password"),
                      validator: (value) => inputValidate(value, "Enter the password!"),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if(_loginFormKey.currentState!.validate()) {

                          }
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => const MainBottomNavScreen(),),);
                        },
                        child: const Icon(Icons.arrow_circle_right_outlined),
                      ),
                    ),
                    const SizedBox(height: 40,),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()));
                        },
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                              color: Colors.green.shade300, fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account?",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: colorGray,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen(),),);
                            },
                            child: Text(
                              "Sign up",
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
      ),
    );
  }
}
