import 'package:flutter/material.dart';
import 'package:flutter_task_management_app/ui/screens/edit_profile_screen.dart';
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
      trailing: const Icon(Icons.arrow_forward),
      tileColor: colorGreen,
    );
  }
}