import 'package:flutter/material.dart';
import 'package:flutter_task_management_app/ui/screens/login_screen.dart';
import 'package:flutter_task_management_app/ui/style.dart';
import '../widgets/body_background_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BodyBackgroundWidget(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: SingleChildScrollView(
              child: Form(
                key: _signUpFormKey,
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
                      controller: _emailTEController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: inputStyle("Email"),
                      validator: (value) => inputValidate(value, "Please Enter Your Email!"),
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: _firstNameTEController,
                      keyboardType: TextInputType.text,
                      decoration: inputStyle("First Name"),
                      validator: (value) => inputValidate(value, "Please Enter Your First Name!"),
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: _lastNameTEController,
                      keyboardType: TextInputType.text,
                      decoration: inputStyle("Last Name"),
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: _mobileTEController,
                      keyboardType: TextInputType.phone,
                      decoration: inputStyle("Mobile"),
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: _passwordTEController,
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
                              "Sign In",
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
      ),
    );
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }

}
