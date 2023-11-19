import 'package:flutter/material.dart';
import '../controllers/auth_controller.dart';
import '../screens/edit_profile_screen.dart';
import '../screens/login_screen.dart';
import '../style.dart';

class ProfileSummery extends StatelessWidget {
  const ProfileSummery({
    super.key,
    this.enableOnTap = true,
  });

  final bool enableOnTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        if(enableOnTap) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const EditProfileScreen(),),);
        }
      },
      leading: const CircleAvatar(
        child: Icon(Icons.person),
      ),
      title: const Text("Ridoy Paul", style: TextStyle(color: colorWhite, fontWeight: FontWeight.w700),),
      subtitle: const Text("cse.ridoypaul@gmail.com", style: TextStyle(color: colorWhite),),
      trailing: IconButton(
        onPressed: () async{
          await AuthController.clearAuthData();
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LoginScreen()), (route) => false);
        },
        color: colorWhite,
        icon: const Icon(Icons.logout),
      ),
      tileColor: colorGreen,
    );
  }
}