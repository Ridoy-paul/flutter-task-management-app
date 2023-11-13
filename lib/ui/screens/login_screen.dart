import 'package:flutter/material.dart';
import 'package:flutter_task_management_app/ui/style.dart';
import '../widgets/body_background_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BodybackgroundWidget(
          child: Padding(
            padding: const  EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 80,),
                Text("Get Started With", style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 16,),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: inputStyle("Email"),
                ),
                const SizedBox(height: 15,),
                TextFormField(
                  obscureText: true,
                  decoration: inputStyle("Password"),
                ),
                const SizedBox(height: 15,),
                ElevatedButton(onPressed: (){}, child: Icon(Icons.arrow_circle_right_outlined))

              ],
            ),
          ),
        ),
      ),
    );
  }
}
