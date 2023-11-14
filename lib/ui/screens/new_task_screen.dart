import 'package:flutter/material.dart';
import 'package:flutter_task_management_app/ui/style.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.person),
              ),
              title: Text("Ridoy Paul", style: TextStyle(color: colorWhite, fontWeight: FontWeight.w700),),
              subtitle: Text("cse.ridoypaul@gmail.com", style: TextStyle(color: colorWhite),),
              trailing: Icon(Icons.arrow_forward),
              tileColor: colorGreen,
            ),
            Row(
              children: [
                SummeryCard(
                  title: "New",
                  value: "9",
                ),
                SummeryCard(
                  title: "New",
                  value: "9",
                ),
                SummeryCard(
                  title: "New",
                  value: "9",
                ),
                SummeryCard(
                  title: "New",
                  value: "9",
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}

class SummeryCard extends StatelessWidget {
  const SummeryCard({
    super.key,
    required this.title,
    required this.value
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        child: Column(
          children: [
            Text(value, style: Theme.of(context).textTheme.titleLarge,),
            Text(title)
          ],
        ),
      ),
    );
  }
}
