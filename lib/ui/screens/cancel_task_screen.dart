import 'package:flutter/material.dart';
import '../widgets/profile_summery_card_widget.dart';
import '../widgets/task_item_card_widget.dart';

class CancelTaskScreen extends StatefulWidget {
  const CancelTaskScreen({super.key});

  @override
  State<CancelTaskScreen> createState() => _CancelTaskScreenState();
}

class _CancelTaskScreenState extends State<CancelTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const ProfileSummery(),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (count, index) {
                  //return const TaskItemCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
