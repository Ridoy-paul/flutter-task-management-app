import 'package:flutter/material.dart';
import '../style.dart';

class ProfileSummery extends StatelessWidget {
  const ProfileSummery({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: CircleAvatar(
        child: Icon(Icons.person),
      ),
      title: Text("Ridoy Paul", style: TextStyle(color: colorWhite, fontWeight: FontWeight.w700),),
      subtitle: Text("cse.ridoypaul@gmail.com", style: TextStyle(color: colorWhite),),
      trailing: Icon(Icons.arrow_forward),
      tileColor: colorGreen,
    );
  }
}